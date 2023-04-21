//
//  OCNODateView.m
//  QJB-iOS
//
//  Created by 张云飞 on 2022/12/1.
//

#import "OCNODateView.h"

@implementation OCNODateView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self addSubview:self.imgView];
        [self addSubview:self.mesLabel];
        
        [self setViewsLayout];
    }
    return self;
}
-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView=[[UIImageView alloc] initWithFrame:CGRectZero];
        _imgView.image = [UIImage imageNamed:@"no_data"];
    }
    return _imgView;
}

-(UILabel *)mesLabel{
    if (!_mesLabel) {
        _mesLabel=[[UILabel alloc] initWithFrame:CGRectZero];
        _mesLabel.text = @"";
        _mesLabel.textColor = [UIColor blackColor];
        _mesLabel.font = [UIFont systemFontOfSize:14];
        _mesLabel.backgroundColor = [UIColor clearColor];
        _mesLabel.textAlignment = NSTextAlignmentCenter;
        _mesLabel.numberOfLines=1;
    }
    return _mesLabel;
}

-(void)setViewsLayout{
//    self.imgView.frame=CGRectMake(0, 0, Scale(190), Scale(190));
//    self.imgView.centerX=self.centerX;
//    self.mesLabel.frame=CGRectMake(0, self.imgView.endY+10, 200, 20);
//    self.mesLabel.centerX=self.centerX;
}
-(void)noDataStyle:(OCNODateViewState)state{
    self.mesLabel.text = [self getNodataMessage:state];
    switch (state) {
        case no_data://默认风格
            [self setViewsLayout];
            break;
        default:
            [self setViewsLayout];
            break;
    }
}

//显示不同的文本
-(NSString *)getNodataMessage:(OCNODateViewState)state{
    switch (state) {
        case list_nodata:
            return @"还没有人上榜，快来抢占吧~";
        case no_data:
            return @"什么都没有找到呢~";
        default:
            return @"什么都没有找到呢~";
    }
}
@end
