//
//  OCNODateView.h
//  QJB-iOS
//
//  Created by 张云飞 on 2022/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    no_data, //无数据
    no_net,  // 无网络
    list_nodata,// 房间排行榜无数据
    othree,  //其他
} OCNODateViewState;
@interface OCNODateView : UIView
@property(nonatomic,strong)UIImageView * imgView;
@property(nonatomic,strong)UILabel *mesLabel;
-(void)noDataStyle:(OCNODateViewState)state;
@end

NS_ASSUME_NONNULL_END
