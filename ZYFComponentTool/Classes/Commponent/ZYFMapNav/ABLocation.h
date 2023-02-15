//
//  ABLocation.h
//  01-定位
//
//  Created by yjin on 15/7/8.



#import <Foundation/Foundation.h>

@class CLLocation;
typedef void(^SuccessLocation)(CLLocation *location);

typedef void(^FailureLocation) (NSError *error);


@interface ABLocation : NSObject

@property (nonatomic, strong)CLLocation *lastLocation;

+ (instancetype)sharedLocation;

//- (void)startUpdatingLocationWithSuccess:(SuccessLocation)success Failure:(FailureLocation)failure ;

+ (BOOL)isCanLocation ;

+ (NSString *)stringWithLocation:(CLLocation *)location;
+ (CLLocation *)locationWithlongitude:(NSString *)longitude latitude:(NSString *)latitude;


+ (CLLocation *)locationWithStringLngLat:(NSString *)stringLngLat;
//- (NSString *)distanceWithlongitude:(NSString *)longitude latitude:(NSString *)latitude;
@end
