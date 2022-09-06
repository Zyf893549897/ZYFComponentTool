//
//  ZYFHUDManager.m
//  ZYFTools
//
//  Created by issuser on 2022/3/29.
//

#import "ZYFHUDManager.h"

@implementation ZYFHUDManager{
    MBProgressHUD *hud;
}

+ (ZYFHUDManager *)sharedHUDManager
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}
- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (MBProgressHUD *)showLoadingWithMessage:(NSString *)title {
    if (hud != nil) {
        [self dismissHUDImmediately];
    }
    hud = [MBProgressHUD showHUDAddedTo:Constoc.AppDelegate.window animated:YES];
    hud.userInteractionEnabled = YES;// 防止HUD阻塞用户交互
    hud.label.text = title;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor=[UIColor blackColor];
    hud.contentColor=[UIColor whiteColor];//附件颜色
    if (@available(iOS 13.0, *)) {
        [hud activityItemsConfiguration];
    }
    return hud;
}
- (MBProgressHUD *)showLoadingWithMessage:(NSString *)title atView:(UIView *)view{
    if (hud != nil) {
        [self dismissHUDImmediately];
    }
    hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;// 防止HUD阻塞用户交互
    hud.label.text = title;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor=[UIColor blackColor];
    hud.contentColor=[UIColor whiteColor];//附件颜色
    if (@available(iOS 13.0, *)) {
        [hud activityItemsConfiguration];
    }
    return hud;
}
- (void)dismissHUD {
    [self dismissHUDDelay:0.5];
}
- (void)showWithMessage:(NSString *)title {
    [self showWithMessage:title delay:1.5];
}

-(void)showWithMessage:(NSString *)title delay:(CGFloat)time
{
    
    if (hud != nil) {
        [MBProgressHUD hideHUDForView:Constoc.AppDelegate.window animated:NO];
    }
    hud = [MBProgressHUD showHUDAddedTo:Constoc.AppDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.margin = 10.f;
    hud.label.numberOfLines = 2;
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor=[UIColor blackColor];//背景色
    hud.contentColor=[UIColor whiteColor];//附件颜色
    if (@available(iOS 13.0, *)) {
        [hud activityItemsConfiguration];
    }
    [hud hideAnimated:YES afterDelay:time];
}
//成功提示
- (void)showSuccess:(NSString *)title{
    [self showImage:@"duigou" andTitle:title];
}
//失败提示
-(void)showEorre:(NSString *)title{
    [self showImage:@"shibai" andTitle:title];
}
//警告提示
-(void)showWarning:(NSString *)title{
    [self showImage:@"jinggao" andTitle:title];
}
-(void)showImage:(NSString *)name andTitle:(NSString *)title{
    if (hud != nil) {
        [MBProgressHUD hideHUDForView:Constoc.AppDelegate.window animated:NO];
    }
    hud = [MBProgressHUD showHUDAddedTo:Constoc.AppDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
    hud.label.text = title;
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.margin = 10.f;
    hud.label.numberOfLines = 2;
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor=[UIColor blackColor];//背景色
    hud.contentColor=[UIColor whiteColor];//附件颜色
    if (@available(iOS 13.0, *)) {
        [hud activityItemsConfiguration];
    }
    [hud hideAnimated:YES afterDelay:1.5];
}


-(void)dismissHUDDelay:(CGFloat)time {
    [self performSelector:@selector(dismissHUDImmediately) withObject:nil afterDelay:time];
}

- (void)dismissHUDImmediately {
    if (hud != nil) {
        hud.customView.tag = 0;
    }
    [hud hideAnimated:YES];
    hud = nil;
}


@end
