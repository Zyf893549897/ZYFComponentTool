//
//  CPMapNavigation.m
//  TransportationCommittee
//
//  Created by yjin on 16/2/22.
//  Copyright © 2016年 pchen. All rights reserved.
//

#import "CPMapNavigation.h"
#import "ABMapNavigation.h"

#import "ZYFTools.h"
#import "CLLocation+ABLocationTransform.h"


// 添加白名单：
// ios9 系统做 LSApplicationQueriesSchemes 在key value 为 nsarry 做适配：
// 添加 qqmap 。 baidumap 。 iosamap


@interface CPMapNavigation()<UIActionSheetDelegate>

@property (nonatomic, assign)CLLocationCoordinate2D destinationCoordinate;
@property (nonatomic, assign)CLLocationCoordinate2D originCoordinate;

@property (nonatomic, strong)NSString *destinationName;



@end
@implementation CPMapNavigation

static  CPMapNavigation *instance;
+ (instancetype)sharedMapNavigation  {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[CPMapNavigation alloc] init];
    
        
    });
    
    return instance;
}


- (void)clickGotoMapWithDestinationName:(NSString *)name  DestinationCoordinate:(CLLocationCoordinate2D )Destination {
    
    NSParameterAssert(name);
    
    self.destinationName = [name copy];
    self.destinationCoordinate = Destination;
    
    [self showActionSheet];
    
}

- (void)clickGotoMapWithDestinationName:(NSString *)name DestinationCoordinate:(CLLocationCoordinate2D)Destination originCoordinate:(CLLocationCoordinate2D)originCoordinate  {

    NSParameterAssert(name);
    self.originCoordinate = originCoordinate;
    self.destinationName = [name copy];
    self.destinationCoordinate = Destination;
    
    [self showActionSheet];
    
}


- (void)showActionSheet {
    if (![ABMapNavigation hasInstallMapApp]) {
        NSLog(@"您尚未安装任何地图，无法导航");
        return;
    }
    WeakSelf(wkself)
    UIAlertController * vc = [UIAlertController alertControllerWithTitle:@"请选择地图" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    if([ABMapNavigation hasInstallBaiduMap]){
        UIAlertAction * actionA = [UIAlertAction actionWithTitle:@"使用百度地图导航" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [wkself p_navigationMapWithName:ABMapNavigationBaiduMap destinationName:wkself.destinationName destinationCoordinate:wkself.destinationCoordinate  originCoordinate:wkself.originCoordinate];
        }];
        [vc addAction:actionA];
    }
    if([ABMapNavigation hasInstallGaodeMap]){
        UIAlertAction * actionB = [UIAlertAction actionWithTitle:@"使用高德地图导航" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [wkself p_navigationMapWithName:ABMapNavigationGaodeMap destinationName:wkself.destinationName destinationCoordinate:wkself.destinationCoordinate  originCoordinate:wkself.originCoordinate];
        }];
        [vc addAction:actionB];
    }
    if([ABMapNavigation hasInstallTengxunMap]){
        UIAlertAction * actionC = [UIAlertAction actionWithTitle:@"使用腾讯地图导航" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [wkself p_navigationMapWithName:ABMapNavigationTengxunMap destinationName:wkself.destinationName destinationCoordinate:wkself.destinationCoordinate  originCoordinate:wkself.originCoordinate];
        }];
        [vc addAction:actionC];
    }
    if([ABMapNavigation hasInstallAppleMap]){
        UIAlertAction * actionD = [UIAlertAction actionWithTitle:@"使用苹果自带地图导航" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [wkself p_navigationMapWithName:ABMapNavigationAppleMap destinationName:wkself.destinationName destinationCoordinate:wkself.destinationCoordinate  originCoordinate:wkself.originCoordinate];
        }];
        [vc addAction:actionD];
    }
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [vc addAction:cancel];
    
    [[ZYFTools zyf_currentVC] presentViewController:vc animated:YES completion:nil];
}

- (void)p_navigationMapWithName:(NSString *)mapName destinationName:(NSString *)destinationName destinationCoordinate:(CLLocationCoordinate2D )destinationCoordinate originCoordinate:(CLLocationCoordinate2D )originCoordinate{
    

#pragma 要改

    if ([ABMapNavigationBaiduMap isEqualToString:mapName]) {
        NSLog(@"调起百度地图");
        
        [ABMapNavigation openBaiduMapWithOriginName:@"我的位置"
                                   originCoordinate:originCoordinate
                                    destinationName:destinationName
                              destinationCoordinate:destinationCoordinate];
        
    }else if([ABMapNavigationGaodeMap isEqualToString:mapName]){
        
        NSLog(@"调起高德地图");
       
        [ABMapNavigation openGaodeMapWithApplication:@"i导游"
                                             originName:@"我的位置" originCoordinate:originCoordinate destinationName:destinationName destinationCoordinate:destinationCoordinate];
        
    }else if ([ABMapNavigationTengxunMap isEqualToString:mapName]){
        
        NSLog(@"调起腾讯地图");
      
        
        [ABMapNavigation openTengxunMapWithoriginName:@"我的位置" originCoordinate:originCoordinate destinationName:destinationName destinationCoordinate:destinationCoordinate];
    
        
    }else if ([ABMapNavigationAppleMap isEqualToString:mapName]){
        
        [ABMapNavigation openAppleMapWithDestinationName:destinationName
                                   destinationCoordinate:destinationCoordinate];
    }
}



@end
