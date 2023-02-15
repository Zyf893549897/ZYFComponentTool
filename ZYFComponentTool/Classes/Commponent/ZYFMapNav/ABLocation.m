//
//  ABLocation.m
//  01-定位
//
//  Created by yjin on 15/7/8.


#import "ABLocation.h"
#import <CoreLocation/CoreLocation.h>
@interface ABLocation ()<CLLocationManagerDelegate>
@property (nonatomic, strong)CLLocationManager *locationManager;

@property (nonatomic, strong)SuccessLocation successBlock;
@property (nonatomic, strong)FailureLocation failureBlock;

@property(nonatomic,assign)BOOL isloction;

@end
@implementation ABLocation
static ABLocation *instance;
+ (instancetype)sharedLocation {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[ABLocation alloc] init];
           });
    
    [instance.locationManager startUpdatingLocation];
    return instance;
    
}

#pragma  mark 懒加载

- (CLLocationManager *)locationManager {
    
    if (_locationManager == nil) {
        
        
      _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self; // 设置代理
        // 设置定位距离过滤参数 (当本次定位和上次定位之间的距离大于或等于这个值时，调用代理方法)
      _locationManager.distanceFilter = 100;
       _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // 设置定位精度(精度越高越耗电)
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];
        }
        
    }
    return  _locationManager;
}



+ (NSString *)stringWithLocation:(CLLocation *)location {

    if (location == nil && [self isCanLocation]) {
        return @"";
    }

    CLLocationCoordinate2D coordinate = location.coordinate;
    NSString *stringLngLat = [NSString stringWithFormat:@"%lf,%lf",coordinate.longitude,coordinate.latitude];

    return stringLngLat;

}



+ (BOOL)isCanLocation  {

    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status || kCLAuthorizationStatusNotDetermined == status){
        return  NO;
    }
    return  YES;

}




+ (CLLocation *)locationWithlongitude:(NSString *)longitude latitude:(NSString *)latitude {
    
    CLLocation *locatio = [[CLLocation alloc] initWithLatitude:  [latitude doubleValue]  longitude:  [longitude doubleValue]];
    return locatio;

}

- (NSString *)distanceWith:(int)distance {
    
    if (distance >= 1000) {
        
        float KMDistance  = (float)distance / 1000.0;
        
        return [NSString stringWithFormat:@"%.1fkm",KMDistance];
        
    }
    
    return [NSString stringWithFormat:@"%dm",distance];
}


+ (CLLocation *)locationWithStringLngLat:(NSString *)stringLngLat {
    
    NSArray *array = [stringLngLat componentsSeparatedByString:@","];
    ;
    
    return  [[CLLocation alloc] initWithLatitude:[array[1] doubleValue] longitude:[array[0] doubleValue]];
    
}


#pragma mark - 实现CLLocationManager的代理方法


/**
 *  当获取到用户的位置会来到该代理方法(调用非常频繁,如果仅仅想拿到用户的位置,获取到位置之后,立马停止定位)
 *
 *  @param locations 数组中就存放着用户所有的位置
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // 1.从数组中取出用户的位置信息
    CLLocation *location = [locations lastObject];
    _lastLocation = location;
   

}

- (void)locationManager: (CLLocationManager *)manager
       didFailWithError: (NSError *)error {
    
    if (self.failureBlock != nil){
        self.failureBlock(error);
    }
    [self.locationManager stopUpdatingLocation];
}

@end
