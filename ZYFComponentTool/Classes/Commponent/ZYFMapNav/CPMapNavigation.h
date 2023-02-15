//
//  CPMapNavigation.h
//  TransportationCommittee
//
//  Created by yjin on 16/2/22.
//  Copyright © 2016年 pchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface CPMapNavigation : NSObject

+ (instancetype)sharedMapNavigation ;

// 注意：传入的 导航坐标系为百度坐标系 ： （cllocaiton 分类处理坐标系的转换）
- (void)clickGotoMapWithDestinationName:(NSString *)name DestinationCoordinate:(CLLocationCoordinate2D)Destination originCoordinate:(CLLocationCoordinate2D)originCoordinate ;


@end
