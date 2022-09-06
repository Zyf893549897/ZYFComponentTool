//
//  ZYFCustomFootRefresh.m
//  ZYFTools
//
//  Created by issuser on 2022/3/29.
//

#import "ZYFCustomFootRefresh.h"

@interface ZYFCustomFootRefresh()
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@property (strong, nonatomic) UIView *custfootView;// 自定义 UI 样式  如果不需要 可以屏蔽
@end
@implementation ZYFCustomFootRefresh
#pragma mark - 懒加载子控件
- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        loadingView.color=[UIColor whiteColor];
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

-(UIView *)custfootView{
    if (!_custfootView) {
        UIView * view =[[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor=[UIColor redColor];
        [self addSubview:_custfootView=view];
    }
    return _custfootView;
}


- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}
#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];

//  如果使用自定义的  custeView  则隐藏  使用系统自带的 则隐藏 custeView
    self.stateLabel.hidden = YES;
    
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.loadingView.constraints.count) return;
    
    CGFloat loadingCenterY = self.mj_h * 0.5;
    self.loadingView.center = CGPointMake(Constoc.ScreenWidth/2, loadingCenterY);
    
    self.custfootView.center=CGPointMake(Constoc.ScreenWidth/2, loadingCenterY);
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.loadingView stopAnimating];
        
    } else if (state == MJRefreshStateRefreshing) {
        [self.loadingView startAnimating];
        self.custfootView.hidden=YES;
    }
    
    if (state==MJRefreshStateNoMoreData) {
        self.custfootView.hidden=NO;
    }else{
        self.custfootView.hidden=YES;
    }
}

@end

