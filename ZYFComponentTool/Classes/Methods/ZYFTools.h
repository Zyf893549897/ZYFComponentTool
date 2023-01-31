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
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小  带行间距
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font: (UIFont *)font andlineSpace:(CGFloat)space;
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
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
+(NSMutableAttributedString *)stringToAttributedstr:(NSString *)htmlString andfont:(CGFloat)font andtextColor:(UIColor *)textcolor lineSpace:(CGFloat)space;

//给lable添加不同颜色文字 并且加下划线
+ (NSAttributedString *)getAttributeWith:(id)sender
                                 addline:(BOOL)isline
                              addSpacing:(CGFloat)space
                                  string:(NSString *)string
                               orginFont:(CGFloat)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(CGFloat)attributeFont
                          attributeColor:(UIColor *)attributeColor;
@end

NS_ASSUME_NONNULL_END
