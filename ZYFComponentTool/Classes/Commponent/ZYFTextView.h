//
//  ZYFTextView.h
//  ZYFComponentTool
//
//  Created by 张云飞 on 2022/9/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYFTextView;

typedef void(^ZYFTextViewHandler)(ZYFTextView *textView);

IB_DESIGNABLE

//带提示的文本输入框，带尾部字数统计，字数限制等
@interface ZYFTextView : UITextView
@property (nonatomic, assign) BOOL showFootNumber; //是否展示尾部计数

@property (nonatomic, assign) BOOL allowFirstempty; //是否允许第一个 字符为空
/**
 便利构造器.
 */
+ (instancetype)textView;

/**
 设定文本改变Block回调. (切记弱化引用, 以免造成内存泄露.)
 */
- (void)addTextDidChangeHandler:(ZYFTextViewHandler)eventHandler;

/**
 设定达到最大长度Block回调. (切记弱化引用, 以免造成内存泄露.)
 */
- (void)addTextLengthDidMaxHandler:(ZYFTextViewHandler)maxHandler;

/**
 最大限制文本长度, 默认为无穷大, 即不限制, 如果被设为 0 也同样表示不限制字符数.
 */
@property (nonatomic, assign) IBInspectable NSUInteger maxLength;

/**
 圆角半径.
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/**
 边框宽度.
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

/**
 边框颜色.
 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/**
 placeholder, 会自适应TextView宽高以及横竖屏切换, 字体默认和TextView一致.
 */
@property (nonatomic, copy)   IBInspectable NSString *placeholder;

/**
 placeholder文本颜色, 默认为#C7C7CD.
 */
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

/**
 placeholder文本字体, 默认为UITextView的默认字体.
 */
@property (nonatomic, strong) UIFont *placeholderFont;

/**
 是否允许长按弹出UIMenuController, 默认为YES.
 */
@property (nonatomic, assign, getter=isCanPerformAction) BOOL canPerformAction;

/**
 该属性返回一个经过处理的 `self.text` 的值, 去除了首位的空格和换行.
 */
@property (nonatomic, readonly) NSString *formatText;

@end


NS_ASSUME_NONNULL_END
