//
//  UIButton+Custom.h
//  GoShopping
//
//  Created by Mac on 16/4/22.
//  Copyright (c) 2016年 ShopNum1. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    Top,
    Left,
    Bottom,
    Right,
}UIButtonEdgeInsetsStyle;
@interface UIButton (ZYFExtension)

@property (nonatomic,copy) NSString *title;

@property(nonatomic,strong)NSIndexPath * indexPath;

@property(nonatomic,assign)NSInteger index;
/**
 *style：内容的位置，
 *space：图片和文字之间的距离
 *offset：内容距离边界的偏移
 */
- (void)layoutButtonWithEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space offset:(CGFloat)offset;

//偏移距离 只有文字时 设置偏移距离
- (void)titleOffsetDistance:(CGFloat)offset;

//图片偏移距离
- (void)imageOffsetDistance:(CGFloat)offset;
@end
