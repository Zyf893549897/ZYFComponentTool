//
//
//
//#import "UIButton+ZYFCustom.h"
//#import <objc/runtime.h>
//@implementation UIButton (ZYFExtension)
///**
//*style：内容的位置，
//*space：图片和文字之间的距离
//*offset：内容距离边界的偏移
//*/
//- (void)layoutButtonWithEdgeInsetsStyle:(ZYFUIButtonEdgeInsetsStyle)style
//                        imageTitleSpace:(CGFloat)space offset:(CGFloat)offset{
//    CGFloat imageWith = self.currentImage.size.width;
//    CGFloat imageHeight = self.currentImage.size.height;
//    
//    CGFloat labelWidth = 0.0;
//    CGFloat labelHeight = 0.0;
//    if (@available(iOS 8.0, *)) {
//        labelWidth = self.titleLabel.intrinsicContentSize.width;
//        labelHeight = self.titleLabel.intrinsicContentSize.height;
//    } else {
//        labelWidth = self.titleLabel.frame.size.width;
//        labelHeight = self.titleLabel.frame.size.height;
//    }
//    
//    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
//    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
//    
//    switch (style) {
//        case img_Top: {
//            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space, 0, 0, -labelWidth);
//            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space, 0);
//        }
//            break;
//        case img_Left: {
//            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space);
//            labelEdgeInsets = UIEdgeInsetsMake(0, space, 0, 0);
//            if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight){
//                imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space+offset);
//                labelEdgeInsets = UIEdgeInsetsMake(0, space, 0, offset);
//            }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft){
//                imageEdgeInsets = UIEdgeInsetsMake(0, offset, 0, space);
//                labelEdgeInsets = UIEdgeInsetsMake(0, space+offset, 0, 0);
//            }
//        }
//            break;
//        case img_Bottom: {
//            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space, -labelWidth);
//            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space, -imageWith, 0, 0);
//        }
//            break;
//        case img_Right: {
//            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space, 0, -labelWidth-space);
//            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space, 0, imageWith+space);
//            if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight){
//                imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space, 0, -labelWidth+offset);
//                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space, 0, imageWith+space+offset);
//            }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft){
//                imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space+offset, 0, -labelWidth-space);
//                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith+offset, 0, imageWith+space);
//            }
//        }
//            break;
//        default:
//            break;
//    }
//    self.titleEdgeInsets = labelEdgeInsets;
//    self.imageEdgeInsets = imageEdgeInsets;
//}
////偏移距离 只有文字时 设置偏移距离
//- (void)titleOffsetDistance:(CGFloat)offset{
//    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
//    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight){
//        labelEdgeInsets = UIEdgeInsetsMake(0, 0, 0,offset);
//    }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft){
//        labelEdgeInsets = UIEdgeInsetsMake(0, offset, 0, 0);
//    }
//    self.titleEdgeInsets = labelEdgeInsets;
//}
////图片偏移距离
//- (void)imageOffsetDistance:(CGFloat)offset{
//    UIEdgeInsets imgEdgeInsets = UIEdgeInsetsZero;
//    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight){
//        imgEdgeInsets = UIEdgeInsetsMake(0, 0, 0,offset);
//    }else if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft){
//        imgEdgeInsets = UIEdgeInsetsMake(0, offset, 0, 0);
//    }
//    self.imageEdgeInsets = imgEdgeInsets;
//}
//// 给button 增加的 额外属性
//static void *titleKey = &titleKey;
//-(void)setTitle:(NSString *)title{
//    objc_setAssociatedObject(self, &titleKey, title, OBJC_ASSOCIATION_COPY);
//}
//-(NSString *)title{
//    return objc_getAssociatedObject(self, &titleKey);
//}
//
//static void *indexPathKey = &indexPathKey;
//-(void)setIndexPath:(NSIndexPath *)indexPath{
//    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_COPY);
//}
//-(NSIndexPath *)indexPath{
//    return objc_getAssociatedObject(self, &indexPathKey);
//}
//static void *indexKey = &indexKey;
//-(void)setIndex:(NSInteger)index{
//    objc_setAssociatedObject(self, &indexKey, @(index), OBJC_ASSOCIATION_COPY);
//}
//-(NSInteger)index{
//    return [objc_getAssociatedObject(self, &indexKey) integerValue];
//}
//
//
//
//
//@end
