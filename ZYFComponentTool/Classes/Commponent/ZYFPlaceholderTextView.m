//
//  ZYFPlaceholderTextView.m
//  ZYFComponentTool
//
//  Created by 张云飞 on 2023/1/5.
//

#import "ZYFPlaceholderTextView.h"

@interface ZYFPlaceholderTextView ()
@property (nonatomic, copy) ZYFTextViewHandler changeHandler; ///< 文本改变Block
@property (nonatomic, copy) ZYFTextViewHandler maxHandler; ///< 达到最大限制字符数Block
@property (nonatomic, strong) UILabel *placeholderLabel; ///< placeholderLabel
@property (nonatomic, strong) UILabel* footplaceholderLabel;//尾部计数label
@property (nonatomic, copy) NSString* footplaceholder;
@end
@implementation ZYFPlaceholderTextView

#pragma mark - Override

- (void)dealloc
{
    _changeHandler = NULL;
    _maxHandler = NULL;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending) {
        
        [self layoutIfNeeded];
    }
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    [self initialize];
    
    return self;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    BOOL result = [self.textView canPerformAction:action withSender:sender];
    
    if (result) {
        if (![self.textView respondsToSelector:action]) {
            result = NO;
        } else {
            result = _canPerformAction;
        }
    }
    
    return result;
}

#pragma mark - Private

- (void)initialize
{
    
    
    self.userInteractionEnabled = YES;
    self.textView.delegate=self;
    [self addSubview:self.textView];
    // 基本配置 (需判断是否在Storyboard中设置了值)
    _canPerformAction = YES;
    if (_maxLength == 0 || _maxLength == NSNotFound) {
        _maxLength = NSUIntegerMax;
    }
    
    if (!_placeholderColor) {
        _placeholderColor = [UIColor colorWithRed:0.780 green:0.780 blue:0.804 alpha:1.000];
    }
    // 基本设定 (需判断是否在Storyboard中设置了值)
    if (!self.backgroundColor) {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    if (!self.textView.font) {
        self.font = [UIFont systemFontOfSize:15.f];
    }
    self.placeholderLabel.font = self.textView.font;
    self.placeholderLabel.text = _placeholder; // 可能在Storyboard中设置了Placeholder
    self.placeholderLabel.textColor = _placeholderColor;
    [self.textView addSubview:self.placeholderLabel];
    
    
    self.footplaceholderLabel.font = self.textView.font;
    self.footplaceholderLabel.textColor = _placeholderColor;
    [self addSubview:self.footplaceholderLabel];
    
    self.showFootNumber = NO;//默认不显示
}

#pragma mark - Getter
- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;//将 frame 布局 自动转化为 约束布局
    }
    return _placeholderLabel;
}
- (UILabel *)footplaceholderLabel
{
    if (!_footplaceholderLabel) {
        _footplaceholderLabel = [[UILabel alloc] init];
        _footplaceholderLabel.numberOfLines = 0;
        _footplaceholderLabel.textAlignment=NSTextAlignmentRight;
        _footplaceholderLabel.translatesAutoresizingMaskIntoConstraints = NO;//将 frame 布局 自动转化为 约束布局
    }
    return _footplaceholderLabel;
}
- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
    }
    return _textView;
}
#pragma mark - Setter
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString * str = [textView.text stringByReplacingCharactersInRange:range withString:text];
    self.placeholderLabel.hidden = str.length > 0 ? YES : NO;

    // 是否禁止第一个字符输入空格或者换行 默认 不禁止
    if (self.allowFirstempty) {
        if (str.length == 1) {
            if ([str isEqualToString:@" "] || [str isEqualToString:@"\n"]) {
                self.textView.text = @"";
            }
        }
    }
    if (str.length>self.maxLength){
        !_maxHandler ?: _maxHandler(str); // 回调达到最大限制的Block.
        [self.textView.undoManager removeAllActions]; // 达到最大字符数后清空所有 undoaction, 以免 undo 操作造成crash.
        return NO;
    }
    // 回调文本改变的Block.
    !_changeHandler ?: _changeHandler(str);
    self.footplaceholderLabel.text=[NSString stringWithFormat:@"%ld/%ld",str.length,self.maxLength];
    
    return YES;
}

- (void)setFont:(UIFont *)font{
    [self.textView setFont:font];
    self.placeholderLabel.font = font;
    self.footplaceholderLabel.font=font;
}
- (void)setMaxLength:(NSUInteger)maxLength{
    _maxLength = fmax(0, maxLength);
    self.footplaceholderLabel.text = [NSString stringWithFormat:@"0/%ld",self.maxLength];
    self.textView.text = self.textView.text;
}
-(void)setShowFootNumber:(BOOL)showFootNumber{
    _showFootNumber = showFootNumber;
    self.footplaceholderLabel.hidden = !showFootNumber;
    [self isShowFootNumberLayout:showFootNumber];
}

-(void)isShowFootNumberLayout:(BOOL)show{
    if (show){
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-20);
        }];
        [self.placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(8);
            make.right.mas_equalTo(-6);
        }];
        [self.footplaceholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-6);
            make.right.mas_equalTo(-8);
        }];
    }else{
        [self.textView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        [self.placeholderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(8);
            make.right.mas_equalTo(-6);
        }];
        [self.footplaceholderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-6);
            make.right.mas_equalTo(-8);
        }];
    }
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor{
    if (!borderColor) return;
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

- (void)setPlaceholder:(NSString *)placeholder{
    if (!placeholder) return;
    _placeholder = [placeholder copy];
    if (_placeholder.length > 0) {
        self.placeholderLabel.text = _placeholder;
    }
}
-(void)setFootplaceholder:(NSString *)footplaceholder{
    _footplaceholder = [footplaceholder copy];
    self.footplaceholderLabel.text = _footplaceholder;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    if (!placeholderColor) return;
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = _placeholderColor;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont{
    if (!placeholderFont) return;
    _placeholderFont = placeholderFont;
    self.placeholderLabel.font = _placeholderFont;
}

#pragma mark - Public
- (void)addTextDidChangeHandler:(ZYFTextViewHandler)changeHandler
{
    _changeHandler = [changeHandler copy];
}

- (void)addTextLengthDidMaxHandler:(ZYFTextViewHandler)maxHandler
{
    _maxHandler = [maxHandler copy];
}
@end

