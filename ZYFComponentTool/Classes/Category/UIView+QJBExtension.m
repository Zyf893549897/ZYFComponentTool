//
//  UIView+QJBExtension.m
//  QJB-iOS
//
//  Created by 张云飞 on 2022/9/20.
//

#import "UIView+QJBExtension.h"

@implementation UIView (QJBExtension)
+ (Class)layerClass {
    return [CAGradientLayer class];
}
+ (UIView *)az_gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view az_setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}
//设置渐变色
- (void)az_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.az_colors = [colorsM copy];
    self.az_locations = locations;
    self.az_startPoint = startPoint;
    self.az_endPoint = endPoint;
}

#pragma mark- Getter&Setter

- (NSArray *)az_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAz_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(az_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.az_colors];
    }
}

- (NSArray<NSNumber *> *)az_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAz_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(az_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.az_locations];
    }
}

- (CGPoint)az_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setAz_startPoint:(CGPoint)startPoint {
    objc_setAssociatedObject(self, @selector(az_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.az_startPoint];
    }
}

- (CGPoint)az_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setAz_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(az_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.az_endPoint];
    }
}


//设置倒角和边框
-(void)setlayerRadius:(CGFloat)radius andBorderwidth:(CGFloat)width andBorderColor:(nullable UIColor *)color{
    self.layer.cornerRadius=radius;
    self.clipsToBounds=YES;
    self.layer.borderWidth=width;
    self.layer.borderColor=color.CGColor;
}
//倒角
-(void)viewMaskLayer:(CGFloat)degree andStata:(CornerState)state{
    CGRect oldRect = self.bounds;
    switch (state) {
        case up:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(degree, degree)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.path = maskPath.CGPath;
            maskLayer.frame = oldRect;
            self.layer.mask = maskLayer;
            break;
        }
        case down:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(degree, degree)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.path = maskPath.CGPath;
            maskLayer.frame = oldRect;
            self.layer.mask = maskLayer;
            break;
        }
        case all:{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:oldRect byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(degree, degree)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.path = maskPath.CGPath;
            maskLayer.frame = oldRect;
            self.layer.mask = maskLayer;
            break;
        }
        default:
            break;
    }
}



//显示到window上
- (void)cj_showInAppWindow
{
    if (Constoc.AppWindow) {
        [Constoc.AppWindow addSubview:self];
    }
}

- (void)cj_showInAppWindowAnimation
{
    if (Constoc.AppWindow) {
        [Constoc.AppWindow addSubview:self];
    }
    self.alpha = 0;
    [UIView animateWithDuration:.2 animations:^{
    self.alpha = 1;
    }];
    
}
@end
