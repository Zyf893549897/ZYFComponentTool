//
//  ZYFFootRefresh.m
//  ZYFTools
//
//  Created by issuser on 2022/3/29.
//

#import "ZYFFootRefresh.h"

@interface ZYFFootRefresh()
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end
@implementation ZYFFootRefresh
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
    
    //    /** 普通闲置状态 */
    //    MJRefreshStateIdle = 1,
    //    /** 松开就可以进行刷新的状态 */
    //    MJRefreshStatePulling,
    //    /** 正在刷新中的状态 */
    //    MJRefreshStateRefreshing,
    //    /** 即将刷新的状态 */
    //    MJRefreshStateWillRefresh,
    //    /** 所有数据加载完毕，没有更多的数据了 */
    //    MJRefreshStateNoMoreData
    
    [self setTitle:@"~上拉加载更多~" forState:MJRefreshStateIdle];
    [self setTitle:@"~上拉加载更多~" forState:MJRefreshStatePulling];
    [self setTitle:@"" forState:MJRefreshStateRefreshing];
    [self setTitle:@"" forState:MJRefreshStateWillRefresh];
    [self setTitle:@"~没有更多了~" forState:MJRefreshStateNoMoreData];
    
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.loadingView.constraints.count) return;
    
    CGFloat loadingCenterY = self.mj_h * 0.5;
    self.loadingView.center = CGPointMake(Constoc.ScreenWidth/2, loadingCenterY);
    
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.loadingView stopAnimating];
    } else if (state == MJRefreshStateRefreshing) {
        [self.loadingView startAnimating];
    }
}


@end
