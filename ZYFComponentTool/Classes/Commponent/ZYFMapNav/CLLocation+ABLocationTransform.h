//
//  CLLocation+ABLocationTransform.h
//  ABLocationManager
//
//  Created by Liu Zhao on 16/1/26.
//  Copyright © 2016年 Kang YongShuai. All rights reserved.
//

/*
 从 CLLocationManager 取出来的经纬度放到 mapView 上显示，是错误的!
 从 CLLocationManager 取出来的经纬度去 Google Maps API 做逆地址解析，当然是错的！
 从 MKMapView 取出来的经纬度去 Google Maps API 做逆地址解析终于对了。去百度地图API做逆地址解析，依旧是错的！
 从上面两处取的经纬度放到百度地图上显示都是错的！错的！的！
 
 locationManager就是因为得到的是火星坐标偏移后的经纬度，所以导致在MapView上有很大的偏差，而在MKMapView上通
 过定位自己位置所获得的经纬度有是准确，因为apple已经对国内地图做了偏移优化
 
 分为:
    地球坐标，
    火星坐标(iOS mapView 高德 国内google 搜搜 阿里云 都是火星坐标)
    百度坐标(百度地图数据主要都是四维图新提供的)
 
 当用到CLLocationManager 得到的数据转化为火星坐标, MKMapView不用处理
 
 CLLocationManager    地球坐标系
 火星坐标:             MKMapView
 百度地图API            百度坐标
 图吧地图API            图吧坐标
 搜狐搜狗API            搜狗坐标
 高德地图API            火星坐标
 灵图地图API            火星坐标
 腾讯搜搜API            火星坐标
 阿里地图API            火星坐标
 */

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (ABLocationTransform)

//地球坐标 => 火星坐标
- (CLLocation*)locationMarsFromEarth;

//火星坐标 => 百度坐标
- (CLLocation*)locationBaiduFromMars;

//地球坐标 => 百度坐标
- (CLLocation*)locationBaiduFromEarth;

//百度坐标 => 火星坐标
- (CLLocation*)locationMarsFromBaidu;

//火星坐标 => 地球坐标
- (CLLocation*)locationEarthFromMars;

//百度坐标 => 地球坐标
- (CLLocation*)locationEarthFromBaidu;


@end
