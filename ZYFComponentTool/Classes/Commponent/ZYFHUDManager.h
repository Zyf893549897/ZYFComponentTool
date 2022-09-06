//
//  ZYFHUDManager.h
//  ZYFTools
//
//  Created by issuser on 2022/3/29.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZYFHUDManager : NSObject
+ (ZYFHUDManager *)sharedHUDManager;

 //带文字的常显示loading   默认显示在window上 全部 遮挡
- (MBProgressHUD *)showLoadingWithMessage:(NSString *)title;

//带文字的常显示loading   显示在特定的view 上  其他区域可正常响应触摸操作
- (MBProgressHUD *)showLoadingWithMessage:(NSString *)title atView:(UIView *)view;

//仅提示作用
- (void)showWithMessage:(NSString *)title;
//成功提示
- (void)showSuccess:(NSString *)title;
//失败提示
-(void)showEorre:(NSString *)title;
//警告提示
-(void)showWarning:(NSString *)title;
// 提示 显示时间
- (void)showWithMessage:(NSString *)title delay:(CGFloat)time;

- (void)dismissHUD;// 对应的隐藏loading
@end

NS_ASSUME_NONNULL_END
