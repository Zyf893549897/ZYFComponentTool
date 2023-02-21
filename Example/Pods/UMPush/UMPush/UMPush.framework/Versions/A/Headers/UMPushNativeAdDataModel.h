//
//  UMPushNativeAdDataModel.h
//  UMessage
//
//  Created by 彦克 on 2021/12/1.
//  Copyright © 2021 umeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UMPushNativeAdDataModel : NSObject

/**
 广告标题
 */
@property (nonatomic, copy, readonly) NSString *title;
/**
 广告内容描述
 */
@property (nonatomic, copy, readonly) NSString *content;
/**
 广告App 图标Url
 */
@property (nonatomic, copy, readonly) NSString *iconUrl;

/**
 广告大图Url
 */
@property (nonatomic, copy, readonly) NSString *imageUrl;

/**
 广告价格：单位分
*/
@property (nonatomic, strong, readonly) NSNumber *price;
@end

NS_ASSUME_NONNULL_END
