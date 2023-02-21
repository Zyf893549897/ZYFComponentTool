//
//  UMUnionSdk.h
//  UMessage
//
//  Created by 彦克 on 2021/11/30.
//  Copyright © 2021 umeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UMPushAdBannerDelegate <NSObject>

/// 请求广告数据成功回调
- (void)uadBannerDidLoad;

/// 请求广告数据失败回调
/// @param error 失败信息
- (void)uadBannerDidLoadFailWithError:(NSError *_Nullable)error;

/// 广告显示回调
- (void)uadBannerExposeSuccess;

/// 广告点击回调
- (void)uadBannerClicked;

/// 广告关闭回调
- (void)uadBannerClose;

@end

@interface UMPushAdSdk : NSObject

/**
 手动加载并展示广告
 */
+ (void)loadAdAndShowWithDelegate:(id<UMPushAdBannerDelegate> __nullable)delegate viewController:(UIViewController * __nonnull)viewController;
/**
 自动加载广告
 */
+ (void)autoLoadAdAndShowWithDelegate:(id<UMPushAdBannerDelegate> __nullable)delegate;
/**
 关闭自动加载广告
 */
+ (void)endAutoLoadAdAndShow;

@end

NS_ASSUME_NONNULL_END
