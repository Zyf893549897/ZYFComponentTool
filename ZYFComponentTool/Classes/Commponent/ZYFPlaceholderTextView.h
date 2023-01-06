//
//  ZYFPlaceholderTextView.h
//  ZYFComponentTool
//
//  Created by 幸荟 on 2023/1/5.
//

#import <UIKit/UIKit.h>

typedef void(^ZYFTextViewHandler)(NSString *text);

@interface ZYFPlaceholderTextView : UIView<UITextViewDelegate>

@property (nonatomic, strong)UITextView * textView;

@property (nonatomic, assign) BOOL showFootNumber; //是否展示尾部计数

@property (nonatomic, assign) BOOL allowFirstempty; //是否允许第一个 字符为空

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

@end


