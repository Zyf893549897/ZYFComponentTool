//
//  UIScrollView+RefreshNodataExtension.h
//  MiGuo
//
//  Created by mac on 2023/4/7.
//  Copyright © 2023 MrShi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LYEmptyView/LYEmptyView.h>

NS_ASSUME_NONNULL_BEGIN


@protocol RefreshNodataDelegate <NSObject>
@optional
-(void)uploadNewDataAction;//上拉
-(void)downloadMoreDataAction;//下拉

@end

@interface UIScrollView (RefreshNodataExtension)
@property(nonatomic,weak)id<RefreshNodataDelegate> refrashDelegate;
@property (nonatomic, assign) NSInteger page_no;//刷新参数 页码
@property(nonatomic,strong)LYEmptyView * emptyView; //无数据页面
@property(nonatomic,strong)NoDataView * noDataView;
//上下拉刷新
-(void)addUpAndDownRefresh;//添加刷新
//下拉
-(void)downloadMoreData;
//上拉
-(void)uploadNewData;
//结束刷新
-(void)endRefresh;
//没有更多数据了
-(void)noMoreDate;

@end

NS_ASSUME_NONNULL_END
