//
//  ABMapNavigation.m
//  LoveTourGuide
//
//  Created by Liu Zhao on 15/12/16.
//  Copyright © 2015年 pchen. All rights reserved.
//

#import "ABMapNavigation.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>//苹果地图
#define iOS9 [[UIDevice currentDevice].systemVersion floatValue]>=9.0 ? YES:NO


NSString *const ABMapNavigationBaiduMap=@"百度地图";
NSString *const ABMapNavigationGaodeMap=@"高德地图";
NSString *const ABMapNavigationTengxunMap=@"腾讯地图";
NSString *const ABMapNavigationGooogleMap=@"谷歌地图";
NSString *const ABMapNavigationAppleMap=@"苹果地图";
#import "CLLocation+ABLocationTransform.h"
@implementation ABMapNavigation

//记录上次打开的地图
+ (NSString *)hasNavigation{
   return [[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromSelector(@selector(hasNavigation))];
}

+ (void)setHasNavigationWithName:(NSString *)name{
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:NSStringFromSelector(@selector(hasNavigation))];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//判断是否安装了其他地图
+ (BOOL)hasInstallMapApp{
    //目前只支持百度
    return [self hasInstallBaiduMap]||[self hasInstallGaodeMap]||[self hasInstallTengxunMap]||[self hasInstallAppleMap];//||[self hasInstallGoogleMap]
}

#pragma mark - 百度地图
//是否安装了百度地图，注意iOS9要配置plist文件LSApplicationQueriesSchemes: baidumap
+ (BOOL)hasInstallBaiduMap{
    return [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"baidumap://map/"]];
}

+ (void)openBaiduMapWithOriginName:(NSString *)originName
                  originCoordinate:(CLLocationCoordinate2D) originCoordinate
                   destinationName:(NSString *)destinationName
             destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate{
    //编辑起点
    NSString *originStr=[NSString stringWithFormat:@"origin=latlng:%f,%f|name:%@",originCoordinate.latitude,originCoordinate.longitude,originName];
    //编辑终点
    NSString *destinationStr=[NSString stringWithFormat:@"destination=latlng:%f,%f|name:%@",destinationCoordinate.latitude,destinationCoordinate.longitude,destinationName];
    //&coord_type=gcj02
    //&mode=driving / walking / transit
    
    NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?%@&%@&mode=transit",originStr,destinationStr] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
    
    //调用打开方法后，记录这次打开的是哪个地图，下次会默认打开此地图
//    [self setHasNavigationWithName:ABMapNavigationBaiduMap];
}

#pragma mark - 高德地图
//是否安装了高德地图 //是否安装了高德地图，注意iOS9要配置plist文件LSApplicationQueriesSchemes: iosamap
+ (BOOL)hasInstallGaodeMap{
    return [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"iosamap://"]];
}



//打开高德地图客户端 ， 高德地图 URL API
+ (void)openGaodeMapWithApplication:(NSString *)application
                             originName:(NSString *)originName
                  originCoordinate:(CLLocationCoordinate2D) originCoordinate
                       
                   destinationName:(NSString *)destinationName
             destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate{
    
    
    
    CLLocation *oriLocation = [[CLLocation alloc] initWithLatitude:originCoordinate.latitude longitude:originCoordinate.longitude];
    CLLocation *marsLocation = [oriLocation locationMarsFromBaidu];
    
    originCoordinate = marsLocation.coordinate;
    
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:destinationCoordinate.latitude longitude:destinationCoordinate.longitude];
    
    CLLocation *resulutLocation = [location locationMarsFromBaidu];
    destinationCoordinate = resulutLocation.coordinate;
    
     // 起点 //
    NSString *originStr=[NSString stringWithFormat:@"sid=BGVIS1&slat=%lf&slon=%lf&sname=%@",originCoordinate.latitude,originCoordinate.longitude,originName];
    
    //添加编辑返回应用信息
    NSString *backStr=[NSString stringWithFormat:@"sourceApplication=%@",application];
    
    //
    
    //目的地
    NSString *destinationStr=[NSString stringWithFormat:@"dname=%@&dlat=%lf&dlon=%lf&did=BGVIS2",destinationName,destinationCoordinate.latitude,destinationCoordinate.longitude];
    
    //dev=0,这里填0就行了，跟上面的gcj02一个意思 1代表wgs84 也用不上  t---》 0：驾车  1：公交   2：步行
    NSString *urlString = [[NSString stringWithFormat:@"iosamap://path?%@&%@&%@&dev=0&m=0&t=1",backStr,originStr,destinationStr] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];

}

#pragma mark - 腾讯地图
//是否安装了腾讯地图 //是否安装了腾讯地图，注意iOS9要配置plist文件LSApplicationQueriesSchemes: qqmap
+ (BOOL)hasInstallTengxunMap{
    return [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"qqmap://"]];
}

//打开腾讯地图客户端

+ (void)openTengxunMapWithoriginName:(NSString *)originName
                    originCoordinate:(CLLocationCoordinate2D) originCoordinate

                     destinationName:(NSString *)destinationName
               destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate {
    
    
    CLLocation *oriLocation = [[CLLocation alloc] initWithLatitude:originCoordinate.latitude longitude:originCoordinate.longitude];
    CLLocation *marsLocation = [oriLocation locationMarsFromBaidu];
    
    originCoordinate = marsLocation.coordinate;
    
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:destinationCoordinate.latitude longitude:destinationCoordinate.longitude];
    
    CLLocation *resulutLocation = [location locationMarsFromBaidu];
    destinationCoordinate = resulutLocation.coordinate;
    
    
    NSString *originStr=[NSString stringWithFormat:@"fromcoord=%f,%f",originCoordinate.latitude,originCoordinate.longitude];
    //目的地  type  公交：bus 驾车：drive  步行：walk（仅适用移动端）
    NSString *destinationStr=[NSString stringWithFormat:@"tocoord=%f,%f",destinationCoordinate.latitude,destinationCoordinate.longitude];
    
    NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?type=bus&%@&%@&coord_type=2&policy=0&from=%@&to=%@",originStr,destinationStr,originName,destinationName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
    
}



#pragma mark - 谷歌地图
//NSString *urlString = [NSString stringWithFormat:@"comgooglemaps://?saddr=&daddr=%f,%f¢er=%f,%f&directionsmode=transit", endCoor.latitude, endCoor.longitude, startCoor.latitude, startCoor.longitude];

//是否安装了谷歌地图 //是否安装了谷歌地图，注意iOS9要配置plist文件LSApplicationQueriesSchemes: comgooglemaps
+ (BOOL)hasInstallGoogleMap{
    return [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]];
}

//打开谷歌地图客户端
+ (void)openGoogleMapWithOriginCoordinate:(CLLocationCoordinate2D) originCoordinate
                          destinationName:(NSString *)destinationName
                    destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate{
    
    //添加编辑返回应用信息
    NSString *oaStr=[NSString stringWithFormat:@"saddr=%@&daddr=%f,%f¢er=%f,%f",destinationName,destinationCoordinate.latitude,destinationCoordinate.longitude,originCoordinate.latitude,originCoordinate.longitude];
    NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?%@&directionsmode=transit",oaStr] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    

}

#pragma mark - 苹果自带地图
+ (BOOL)hasInstallAppleMap{
    return YES;
}

//打开苹果地图导航
+ (void)openAppleMapWithDestinationName:(NSString *)destinationName
                   destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate{

    
    
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:destinationCoordinate.latitude longitude:destinationCoordinate.longitude];
    
    CLLocation *resulutLocation = [location locationMarsFromBaidu];
    destinationCoordinate = resulutLocation.coordinate;
    
    
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:destinationCoordinate addressDictionary:nil];
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:placemark];
    toLocation.name = destinationName;
    
    if (iOS9) {
        
        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                       launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
        
    }else {
        
        [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                       launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
        
    }
    
 
}

@end
