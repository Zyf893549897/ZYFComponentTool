//
//  UIView+QJBExtension.h
//  QJB-iOS
//
//  Created by 张云飞 on 2022/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//定义枚举类型
typedef enum CornerStyle{
    all,
    up,
    down,
}CornerState;

@interface UIView (QJBExtension)

@property(nullable, copy) NSArray *az_colors;
@property(nullable, copy) NSArray<NSNumber *> *az_locations;
@property CGPoint az_startPoint;
@property CGPoint az_endPoint;

+ (UIView *_Nullable)az_gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
//设置渐变色
- (void)az_setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


-(void)viewMaskLayer:(CGFloat)degree andStata:(CornerState)state;

//设置倒角和边框
-(void)setlayerRadius:(CGFloat)radius andBorderwidth:(CGFloat)width andBorderColor:(nullable UIColor *)color;


//显示到window上
- (void)cj_showInAppWindow;

- (void)cj_showInAppWindowAnimation;

//view转 image
- (UIImage *)imageWithColors:(NSArray *)colors;

//获取绝对坐标
-(CGRect)getAbsolutePosition;
@end

NS_ASSUME_NONNULL_END
