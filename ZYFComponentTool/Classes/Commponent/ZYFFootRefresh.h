//
//  ZYFFootRefresh.h
//  ZYFTools
//
//  Created by issuser on 2022/3/29.
//

#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYFFootRefresh : MJRefreshAutoStateFooter
/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;
@end

NS_ASSUME_NONNULL_END
