//
//#import "ZYFTextView.h"
//@interface ZYFTextView ()
//@property (nonatomic, copy) ZYFTextViewHandler changeHandler; ///< 文本改变Block
//@property (nonatomic, copy) ZYFTextViewHandler maxHandler; ///< 达到最大限制字符数Block
//@property (nonatomic, strong) UILabel *placeholderLabel; ///< placeholderLabel
//@property (nonatomic, strong) UILabel* footplaceholderLabel;//尾部计数label
//@property (nonatomic, copy) NSString* footplaceholder;
//@end
//
//@implementation ZYFTextView
//
//#pragma mark - Override
//
//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    _changeHandler = NULL;
//    _maxHandler = NULL;
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (!(self = [super initWithCoder:aDecoder])) return nil;
//    
//    if ([[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending) {
//        
//        [self layoutIfNeeded];
//    }
//    
//    [self initialize];
//    
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (!(self = [super initWithFrame:frame])) return nil;
//    [self initialize];
//    
//    return self;
//}
//
//- (BOOL)becomeFirstResponder
//{
//    BOOL become = [super becomeFirstResponder];
//    
//    // 成为第一响应者时注册通知监听文本变化
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
//    
//    return become;
//}
//
//- (BOOL)resignFirstResponder
//{
//    BOOL resign = [super resignFirstResponder];
//    
//    // 注销第一响应者时移除文本变化的通知, 以免影响其它的`UITextView`对象.
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
//    
//    return resign;
//}
//
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
//    BOOL result = [super canPerformAction:action withSender:sender];
//    
//    if (result) {
//        if (![self respondsToSelector:action]) {
//            result = NO;
//        } else {
//            result = _canPerformAction;
//        }
//    }
//    
//    return result;
//}
//
//#pragma mark - Private
//
//- (void)initialize
//{
//    // 基本配置 (需判断是否在Storyboard中设置了值)
//    _canPerformAction = YES;
//    if (_maxLength == 0 || _maxLength == NSNotFound) {
//        _maxLength = NSUIntegerMax;
//    }
//    
//    if (!_placeholderColor) {
//        _placeholderColor = [UIColor colorWithRed:0.780 green:0.780 blue:0.804 alpha:1.000];
//    }
//    // 基本设定 (需判断是否在Storyboard中设置了值)
//    if (!self.backgroundColor) {
//        self.backgroundColor = [UIColor whiteColor];
//    }
//    
//    if (!self.font) {
//        self.font = [UIFont systemFontOfSize:15.f];
//    }
//    self.placeholderLabel.font = self.font;
//    self.placeholderLabel.text = _placeholder; // 可能在Storyboard中设置了Placeholder
//    self.placeholderLabel.textColor = _placeholderColor;
//    [self addSubview:self.placeholderLabel];
//   
//}
//
//#pragma mark - Getter
///// 返回一个经过处理的 `self.text` 的值, 去除了首位的空格和换行.
//- (NSString *)formatText
//{
//    return [[super text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; // 去除首尾的空格和换行.
//}
//
//- (UILabel *)placeholderLabel
//{
//    if (!_placeholderLabel) {
//        
//        _placeholderLabel = [[UILabel alloc] init];
//        _placeholderLabel.numberOfLines = 0;
//        _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;//将 frame 布局 自动转化为 约束布局
//        
//    }
//    
//    return _placeholderLabel;
//}
//- (UILabel *)footplaceholderLabel
//{
//    if (!_footplaceholderLabel) {
//        _footplaceholderLabel = [[UILabel alloc] init];
//        _footplaceholderLabel.numberOfLines = 0;
//        _footplaceholderLabel.textAlignment=NSTextAlignmentRight;
//        _footplaceholderLabel.translatesAutoresizingMaskIntoConstraints = NO;//将 frame 布局 自动转化为 约束布局
//    }
//    return _footplaceholderLabel;
//}
//
//#pragma mark - Setter
//
//- (void)setText:(NSString *)text
//{
//    [super setText:text];
//    
//    self.placeholderLabel.hidden = [@(text.length) boolValue];
//    // 手动模拟触发通知
//    NSNotification *notification = [NSNotification notificationWithName:UITextViewTextDidChangeNotification object:self];
//    [self textDidChange:notification];
//}
//
//- (void)setFont:(UIFont *)font{
//    [super setFont:font];
//    
//    self.placeholderLabel.font = font;
//    self.footplaceholderLabel.font=font;
//}
//
//- (void)setMaxLength:(NSUInteger)maxLength
//{
//    _maxLength = fmax(0, maxLength);
//    self.text = self.text;
//}
//-(void)setShowFootNumber:(BOOL)showFootNumber{
//    _showFootNumber = showFootNumber;
//    if (self.showFootNumber) {
//        self.footplaceholderLabel.font = self.font;
//        self.footplaceholderLabel.text = [NSString stringWithFormat:@"0/%ld",self.maxLength];
//        self.footplaceholderLabel.textColor = _placeholderColor;
//        [self addSubview:self.footplaceholderLabel];
//    }
//}
//
//-(void)layoutSubviews{
//    [super layoutSubviews];
//    self.placeholderLabel.frame = CGRectMake(6, 5, self.frame.size.width-12, 25);
//    self.footplaceholderLabel.frame = CGRectMake(self.frame.size.width-100, self.frame.size.height-25, 90, 20);
//}
//
//
//- (void)setCornerRadius:(CGFloat)cornerRadius
//{
//    _cornerRadius = cornerRadius;
//    self.layer.cornerRadius = _cornerRadius;
//}
//
//- (void)setBorderColor:(UIColor *)borderColor
//{
//    if (!borderColor) return;
//    
//    _borderColor = borderColor;
//    self.layer.borderColor = _borderColor.CGColor;
//}
//
//- (void)setBorderWidth:(CGFloat)borderWidth
//{
//    _borderWidth = borderWidth;
//    self.layer.borderWidth = _borderWidth;
//}
//
//- (void)setPlaceholder:(NSString *)placeholder
//{
//    if (!placeholder) return;
//    
//    _placeholder = [placeholder copy];
//    
//    if (_placeholder.length > 0) {
//        
//        self.placeholderLabel.text = _placeholder;
//    }
//}
//-(void)setFootplaceholder:(NSString *)footplaceholder{
//    _footplaceholder = [footplaceholder copy];
//    self.footplaceholderLabel.text = _footplaceholder;
//}
//
//- (void)setPlaceholderColor:(UIColor *)placeholderColor
//{
//    if (!placeholderColor) return;
//    
//    _placeholderColor = placeholderColor;
//    
//    self.placeholderLabel.textColor = _placeholderColor;
//}
//
//- (void)setPlaceholderFont:(UIFont *)placeholderFont
//{
//    if (!placeholderFont) return;
//    
//    _placeholderFont = placeholderFont;
//    
//    self.placeholderLabel.font = _placeholderFont;
//}
//
//#pragma mark - NSNotification
//- (void)textDidChange:(NSNotification *)notification
//{
//    // 通知回调的实例的不是当前实例的话直接返回
//    if (notification.object != self) return;
//    
//    // 根据字符数量显示或者隐藏 `placeholderLabel`
//    self.placeholderLabel.hidden = [@(self.text.length) boolValue];
//    
//    // 是否禁止第一个字符输入空格或者换行 默认 不禁止
//    if (self.allowFirstempty) {
//        if (self.text.length == 1) {
//
//            if ([self.text isEqualToString:@" "] || [self.text isEqualToString:@"\n"]) {
//
//                self.text = @"";
//            }
//        }
//    }
//    
//    // 只有当maxLength字段的值不为无穷大整型也不为0时才计算限制字符数.
//    if (_maxLength != NSUIntegerMax && _maxLength != 0 && self.text.length > 0) {
//        
//        if (!self.markedTextRange && self.text.length > _maxLength) {
//            
//            !_maxHandler ?: _maxHandler(self); // 回调达到最大限制的Block.
//            self.text = [self.text substringToIndex:_maxLength]; // 截取最大限制字符数.
//            [self.undoManager removeAllActions]; // 达到最大字符数后清空所有 undoaction, 以免 undo 操作造成crash.
//        }
//    }
//    
//    // 回调文本改变的Block.
//    !_changeHandler ?: _changeHandler(self);
//    
//    self.footplaceholderLabel.text=[NSString stringWithFormat:@"%ld/%ld",self.text.length,self.maxLength];
//}
//
//#pragma mark - Public
//
//+ (instancetype)textView
//{
//    return [[self alloc] init];
//}
//
//- (void)addTextDidChangeHandler:(ZYFTextViewHandler)changeHandler
//{
//    _changeHandler = [changeHandler copy];
//}
//
//- (void)addTextLengthDidMaxHandler:(ZYFTextViewHandler)maxHandler
//{
//    _maxHandler = [maxHandler copy];
//}
//
//@end
