//
//  ABMapNavigation.h
//  LoveTourGuide
//
//  Created by Liu Zhao on 15/12/16.
//  Copyright © 2015年 pchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

FOUNDATION_EXPORT NSString *const ABMapNavigationBaiduMap;
FOUNDATION_EXPORT NSString *const ABMapNavigationGaodeMap;
FOUNDATION_EXPORT NSString *const ABMapNavigationTengxunMap;
FOUNDATION_EXPORT NSString *const ABMapNavigationGooogleMap;
FOUNDATION_EXPORT NSString *const ABMapNavigationAppleMap;

@interface ABMapNavigation : NSObject

+ (NSString *)hasNavigation;

+ (void)setHasNavigationWithName:(NSString *)name;

//判断是否安装了其他地图
+ (BOOL)hasInstallMapApp;

#pragma mark - 百度地图
//是否安装了百度地图，注意iOS9要配置plist文件LSApplicationQueriesSchemes
+ (BOOL)hasInstallBaiduMap;


+ (void)openBaiduMapWithOriginName:(NSString *)originName
                  originCoordinate:(CLLocationCoordinate2D) originCoordinate
                   destinationName:(NSString *)destinationName
             destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate;

#pragma mark - 高德地图
//是否安装了高德地图
+ (BOOL)hasInstallGaodeMap;

//打开高德地图客户端
+ (void)openGaodeMapWithApplication:(NSString *)application
                         originName:(NSString *)originName
                   originCoordinate:(CLLocationCoordinate2D) originCoordinate

                    destinationName:(NSString *)destinationName
              destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate;

#pragma mark - 腾讯地图
//是否安装了腾讯地图
+ (BOOL)hasInstallTengxunMap;

//打开腾讯地图客户端

+ (void)openTengxunMapWithoriginName:(NSString *)originName
                    originCoordinate:(CLLocationCoordinate2D) originCoordinate

                     destinationName:(NSString *)destinationName
               destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate;

#pragma mark - 谷歌地图
//是否安装了谷歌地图
+ (BOOL)hasInstallGoogleMap;

//打开高德地图客户端
+ (void)openGoogleMapWithOriginCoordinate:(CLLocationCoordinate2D) originCoordinate
                          destinationName:(NSString *)destinationName
                    destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate;

#pragma mark - 苹果地图

+ (BOOL)hasInstallAppleMap;

//打开苹果地图导航
+ (void)openAppleMapWithDestinationName:(NSString *)destinationName
                  destinationCoordinate:(CLLocationCoordinate2D) destinationCoordinate;

@end
