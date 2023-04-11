//
//  UIScrollView+RefreshNodataExtension.m
//  MiGuo
//
//  Created by mac on 2023/4/7.
//  Copyright © 2023 MrShi. All rights reserved.
//

#import "UIScrollView+RefreshNodataExtension.h"
#import <objc/runtime.h>
#import "UIView+Empty.h"
#import <MJRefresh/MJRefresh.h>

// 获取屏幕宽高
#define KScreenWidth [UIApplication sharedApplication].windows.firstObject.bounds.size.width
#define KScreenHeight [UIApplication sharedApplication].windows.firstObject.bounds.size.height

//宽度对比的比例值
#define Width_biLi KScreenWidth/375.0f
//按比例计算后的值得大小
#define Scale(size) Width_biLi*size

@interface UIScrollView ()

@end

@implementation UIScrollView (RefreshNodataExtension)

//添加分页  参数
static void *pagaIndexKey = &pagaIndexKey;
- (void)setPage_no:(NSInteger)page_no{
    objc_setAssociatedObject(self, &pagaIndexKey, @(page_no), OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)page_no {
    return [objc_getAssociatedObject(self, &pagaIndexKey) integerValue];
}

//无数据页面
static void *emptyViewKey = &emptyViewKey;
- (void)setEmptyView:(LYEmptyView *)emptyView{
    objc_setAssociatedObject(self, &emptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (LYEmptyView *)emptyView{
    return objc_getAssociatedObject(self, &emptyViewKey);
}


static void *noDataViewKey = &noDataViewKey;
- (void)setNoDataView:(NoDataView *)noDataView{
    objc_setAssociatedObject(self, &noDataViewKey, noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NoDataView *)noDataView{
    return objc_getAssociatedObject(self, &noDataViewKey);
}


//代理
static void *refrashDelegateKey = &refrashDelegateKey;
- (void)setRefrashDelegate:(id<RefreshNodataDelegate>)refrashDelegate{
    objc_setAssociatedObject(self, &refrashDelegateKey, refrashDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id<RefreshNodataDelegate>)refrashDelegate{
    return objc_getAssociatedObject(self, &refrashDelegateKey);
}



//添加刷新
-(void)addUpAndDownRefresh{
    self.page_no = 1;//初始值为1
    
    MJRefreshNormalHeader * gitHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downloadMoreData)];
    self.mj_header = gitHeader;
    /*
     上拉加载更多
     */   //MJRefreshAutoFooter
    MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(uploadNewData)];
    self.mj_footer = footer;
    self.mj_footer.mj_h = 0;
    
    
    self.noDataView = [[NoDataView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, Scale(190))];
    self.emptyView = [LYEmptyView emptyViewWithCustomView:self.noDataView];
    self.emptyView.autoShowEmptyView = YES;
    self.ly_emptyView = self.emptyView;
}
//下拉
-(void)downloadMoreData{
    self.page_no=1;
    //重置为普通状态
    [self.mj_footer setState:MJRefreshStateIdle];
    //超过 15秒  自动结束刷新
    WeakSelf(myself);
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [myself.mj_header endRefreshing];//结束
    });
    if([self.refrashDelegate respondsToSelector:@selector(downloadMoreDataAction)]){
        [self.refrashDelegate downloadMoreDataAction];
    }
}
//上拉
-(void)uploadNewData{
    self.page_no++;
    
    if([self.refrashDelegate respondsToSelector:@selector(uploadNewDataAction)]){
        [self.refrashDelegate uploadNewDataAction];
    }
}
//结束刷新
-(void)endRefresh{
    [self.mj_header endRefreshing];//结束
    [self.mj_footer setState:MJRefreshStateIdle];//
}
//没有更多数据了
-(void)noMoreDate{
    [self.mj_footer setState:MJRefreshStateNoMoreData];
}

@end
