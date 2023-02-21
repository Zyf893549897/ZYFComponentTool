//
//  UMUnionNativeAd.h
//  UMessage
//
//  Created by 彦克 on 2021/11/30.
//  Copyright © 2021 umeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UMPushNativeAdDataModel;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UPushNativeAdType) {
    /**自渲染小图*/
    UPushNativeAdTypeDefault = 0,
    /**自渲染大图*/
    UPushNativeAdTypeBigImg = 1,
    /**自渲染Feed*/
    UPushNativeAdTypeFeed = 2,
};

@protocol UMPushNativeAdDelegate <NSObject>

/**
 广告数据回调

 @param nativeAdDataModel 广告数据
 @param error 错误信息
 */
- (void)nativeAdLoaded:(UMPushNativeAdDataModel * _Nullable)nativeAdDataModel error:(NSError * _Nullable)error;
@end

@interface UMPushNativeAd : NSObject

- (instancetype)initWithType:(UPushNativeAdType)type;

@property (nonatomic, weak) id<UMPushNativeAdDelegate> delegate;
/**
 加载广告
 */
- (void)loadAd;
@end

NS_ASSUME_NONNULL_END
