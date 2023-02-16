//
//  ZYFTools.h
//  ZYFTool
//
//  Created by 张云飞 on 2021/10/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZYFTools : NSObject

/*
 根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小  space 行间距
 */
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font: (UIFont *)font andlineSpace:(CGFloat)space;

/*
 根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
 */
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font: (UIFont *)font;
//根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(UIFont *)font;

//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width fontSize: (CGFloat)font;
//根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height fontSize:(CGFloat)font;
//当前控制器
+ (UIViewController *)zyf_currentVC;
//lable 富文本 展示HTML字符串
+(NSMutableAttributedString *)stringToAttributedstr:(NSString *)htmlString andfont:(UIFont *)font andtextColor:(UIColor *)textcolor lineSpace:(CGFloat)space;


//给lable添加不同颜色文字 并且加下划线
/*
 sendr  需要修改的内容  可以是 数组 或者  字符串
 alignment 对齐方式
 isline 是否加下划线
 space  行间距
 string 主体字符串
 orginFont 主体字体大小
 orginColor 主体颜色
 attributeFont 变化内容的字体
 attributeColors 变化内容的颜色 这里传 数组  如需要修改多个内容  这里的颜色对应  多个内容的不同颜色
 */
+ (NSAttributedString *)getAttributeWith:(id)sender
                                 addline:(BOOL)isline
                               alignment:(NSTextAlignment)alignment
                              addSpacing:(CGFloat)space
                                  string:(NSString *)string
                               orginFont:(UIFont *)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(UIFont *)attributeFont
                         attributeColors:(NSArray *)attributeColors;

@end

NS_ASSUME_NONNULL_END
