//
//  ZYFTools.m
//  ZYFTool
//
//  Created by 张云飞 on 2021/10/9.
//

#import "ZYFTools.h"
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#import "UIView+QJBExtension.h"
@implementation ZYFTools
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小  带行间距
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font: (UIFont *)font andlineSpace:(CGFloat)space{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName: paragraphStyle} context:nil];
    return rect.size.height;
}
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width font: (UIFont *)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}
//根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(UIFont *)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return rect.size.width;
}
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
+ (CGFloat)getHeightWithText:(NSString *)text width:(CGFloat)width fontSize: (CGFloat)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [Constoc scaleFont:font]} context:nil];
    return rect.size.height;
}
////根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height fontSize:(CGFloat)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[Constoc scaleFont:font]}
                                     context:nil];
    return rect.size.width;
}

//当前控制器
+ (UIViewController *)zyf_currentVC{
    //获得当前活动窗口的根视图
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentShowingVC = [self findCurrentShowingViewControllerFrom:vc];
    return currentShowingVC;
}
//注意考虑几种特殊情况：①A present B, B present C，参数vc为A时候的情况/* 完整的描述请参见文件头部 */
+ (UIViewController *)findCurrentShowingViewControllerFrom:(UIViewController *)vc
{    //方法1：递归方法 Recursive method
    UIViewController *currentShowingVC;
    if ([vc presentedViewController]) { //注要优先判断vc是否有弹出其他视图，如有则当前显示的视图肯定是在那上面
        // 当前视图是被presented出来的
        UIViewController *nextRootVC = [vc presentedViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {        // 根视图为UITabBarController
        UIViewController *nextRootVC = [(UITabBarController *)vc selectedViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];
        
    } else if ([vc isKindOfClass:[UINavigationController class]]){        // 根视图为UINavigationController
        UIViewController *nextRootVC = [(UINavigationController *)vc visibleViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];
    } else {        // 根视图为非导航类
        currentShowingVC = vc;
    }
    return currentShowingVC;
}
//lable 富文本 展示HTML字符串
+(NSMutableAttributedString *)stringToAttributedstr:(NSString *)htmlString andfont:(UIFont *)font andtextColor:(UIColor *)textcolor lineSpace:(CGFloat)space{
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    NSRange range = NSMakeRange(0, attrStr.length);
    [attrStr addAttributes:@{NSFontAttributeName : font} range:range];//字体大小
    [attrStr addAttributes:@{NSForegroundColorAttributeName : textcolor} range:range];// 字体颜色
//    [attrStr addAttributes:@{NSKernAttributeName:@(3)} range:range];//设定字符间距   不需要可删除
    //段落样式  不需要可删除
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;//字体的行间距
    [attrStr addAttributes:@{NSParagraphStyleAttributeName:style} range:range];
    return attrStr;
}


//给lable添加不同颜色文字 并且加下划线
+ (NSAttributedString *)getAttributeWith:(id)sender
                                 addline:(BOOL)isline
                               alignment:(NSTextAlignment)alignment
                              addSpacing:(CGFloat)space
                                  string:(NSString *)string
                               orginFont:(UIFont *)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(UIFont *)attributeFont
                         attributeColors:(NSArray *)attributeColors
{
    __block  NSMutableAttributedString *totalStr = [[NSMutableAttributedString alloc] initWithString:string];
    [totalStr addAttribute:NSFontAttributeName value:orginFont range:NSMakeRange(0, string.length)];
    [totalStr addAttribute:NSForegroundColorAttributeName value:orginColor range:NSMakeRange(0, string.length)];
    //行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    [paragraphStyle setLineSpacing:space];//设置距离
    [totalStr addAttribute:NSParagraphStyleAttributeName
                                value:paragraphStyle
                                range:NSMakeRange(0, string.length)];
    
    if ([sender isKindOfClass:[NSArray class]]) {
        __block NSString *oringinStr = string;
        __weak typeof(self) weakSelf = self;
        [sender enumerateObjectsUsingBlock:^(NSString *  _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
            if (str.length > 0) {
                NSRange range = NSMakeRange(0, 0);
                if ([oringinStr containsString:str]) {
                    range = [oringinStr rangeOfString:str];
                    [totalStr addAttribute:NSFontAttributeName value:attributeFont range:range];
                    
                    if (attributeColors.count > idx) {
                        [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColors[idx] range:range];
                    }
                    if (attributeColors.count == 1) {
                        [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColors.firstObject range:range];
                    }
                    
                    if (isline) {
                        NSRange myrange = [string rangeOfString:sender[idx]];
                        [totalStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(myrange.location, myrange.length)];
                    }
                }
                oringinStr = [oringinStr stringByReplacingCharactersInRange:range withString:[weakSelf getStringWithRange:range]];
            }
        }];
    }else if ([sender isKindOfClass:[NSString class]]) {
        NSRange range = [string rangeOfString:sender];
        [totalStr addAttribute:NSFontAttributeName value:attributeFont range:range];
        [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColors range:range];
    }
    return totalStr;
}

+ (NSString *)getStringWithRange:(NSRange)range
{
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < range.length ; i++) {
        [string appendString:@" "];
    }
    return string;
}

//显示图片  imgArr 图片数组url地址   index 第几个图片
+(void)showImage:(NSArray *)imgArr andIndex:(NSInteger)index{
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [imgArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GKPhoto *photo = [[GKPhoto alloc] init];
        photo.url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",obj]];
        [photos addObject:photo];
    }];
    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photos currentIndex:index];
    browser.showStyle = GKPhotoBrowserShowStyleNone;
    [browser showFromVC:[ZYFTools zyf_currentVC]];
}

//显示图片  imgArr 图片数组url地址   index 第几个图片  tapView: 点击img 对象
+(void)showImage:(NSArray *)imgArr andIndex:(NSInteger)index andSourceFrame:(UIView *)tapView{
    CGRect frame = [tapView getAbsolutePosition];
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [imgArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GKPhoto *photo = [[GKPhoto alloc] init];
        photo.url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",obj]];
        photo.sourceFrame = frame;
        [photos addObject:photo];
    }];
    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photos currentIndex:index];
    browser.showStyle = GKPhotoBrowserShowStyleZoom;
    browser.hideStyle = GKPhotoBrowserHideStyleZoomScale;
    [browser showFromVC:[ZYFTools zyf_currentVC]];
}

@end
