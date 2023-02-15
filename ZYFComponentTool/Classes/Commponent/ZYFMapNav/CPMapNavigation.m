//
//  CPMapNavigation.m
//  TransportationCommittee
//
//  Created by yjin on 16/2/22.
//  Copyright © 2016年 pchen. All rights reserved.
//

#import "CPMapNavigation.h"
#import "ABMapNavigation.h"


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
    
    [self showActionSheetInView:Constoc.AppDelegate.window];
    
}

- (void)clickGotoMapWithDestinationName:(NSString *)name DestinationCoordinate:(CLLocationCoordinate2D)Destination originCoordinate:(CLLocationCoordinate2D)originCoordinate  {

    NSParameterAssert(name);
    self.originCoordinate = originCoordinate;
    self.destinationName = [name copy];
    self.destinationCoordinate = Destination;
    
    [self showActionSheetInView:Constoc.AppDelegate.window];
    
}


- (BOOL)showActionSheetInView:(UIView *)view {
    
    if (![ABMapNavigation hasInstallMapApp]) {

        NSLog(@"您尚未安装任何地图，无法导航");
        
        return NO;
    }
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择地图"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:nil];
    if([ABMapNavigation hasInstallBaiduMap]){
        [sheet addButtonWithTitle:@"使用百度地图导航"];
    }
    if ([ABMapNavigation hasInstallGaodeMap]) {
        [sheet addButtonWithTitle:@"使用高德地图导航"];
    }
    if([ABMapNavigation hasInstallTengxunMap]){
        [sheet addButtonWithTitle:@"使用腾讯地图导航"];
    }
    
    if ([ABMapNavigation hasInstallAppleMap]) {
        [sheet addButtonWithTitle:@"使用苹果自带地图导航"];
    }
    [sheet addButtonWithTitle:@"取消"];
    sheet.cancelButtonIndex=sheet.numberOfButtons-1;;
    [sheet showInView:view];
    return YES;
    
}


#pragma mark - actionSheetDelegate 

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
   NSDictionary *mapDic =  @{@"使用百度地图导航":ABMapNavigationBaiduMap,
                              @"使用高德地图导航":ABMapNavigationGaodeMap,
                              @"使用腾讯地图导航":ABMapNavigationTengxunMap,
                              @"使用谷歌地图导航":ABMapNavigationGooogleMap,
                              @"使用苹果自带地图导航":ABMapNavigationAppleMap};
    
    NSLog(@"actionSheet:%ld,%@",(long)buttonIndex,[actionSheet buttonTitleAtIndex:buttonIndex]);
    
    
    [self p_navigationMapWithName:mapDic[[actionSheet buttonTitleAtIndex:buttonIndex]] destinationName:self.destinationName destinationCoordinate:_destinationCoordinate  originCoordinate:_originCoordinate];
    
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
 ;
        

        [ABMapNavigation openAppleMapWithDestinationName:destinationName
                                   destinationCoordinate:destinationCoordinate];
    }
}



@end
