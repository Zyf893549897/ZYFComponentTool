//
//  UMUnionNativeAdView.h
//  UMessage
//
//  Created by 彦克 on 2021/11/30.
//  Copyright © 2021 umeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UMPushNativeAdView,UMPushNativeAdDataModel;

NS_ASSUME_NONNULL_BEGIN

@protocol UMPushNativeAdViewDelegate <NSObject>

@optional
/**
 广告曝光回调

 @param nativeAdView UMPushNativeAdView 实例
 */
- (void)nativeAdViewExpose:(UMPushNativeAdView *)nativeAdView;

/**
 广告点击回调

 @param nativeAdView UMPushNativeAdView 实例
 */
- (void)nativeAdViewDidClick:(UMPushNativeAdView *)nativeAdView;

/**
 广告错误事件回调

 @param error 失败信息
 */
- (void)nativeAdViewWithError:(NSError *)error;

@end

@interface UMPushNativeAdView : UIView

/**
 绑定的数据对象
 */
@property (nonatomic, strong, readonly) UMPushNativeAdDataModel *dataModel;

/**
 广告View代理回调
 */
@property (nonatomic, weak) id<UMPushNativeAdViewDelegate> delegate;

/*
 *开发者需传入用来弹出目标页的ViewController，一般为当前ViewController
 */
@property (nonatomic, weak) UIViewController *viewController;

/**
 自渲染绑定模型
 
 @param dataModel 数据对象，必传字段
 @param clickableViews 可点击的视图数组，此数组内的广告元素才可以响应广告对应的点击事件
 */
- (void)bindDataModel:(UMPushNativeAdDataModel *)dataModel
            clickableViews:(NSArray<UIView *> * __nonnull)clickableViews;

@end

NS_ASSUME_NONNULL_END
