//
//  RestrictedInputTextField.h
//  MiGuo
//
//  Created by mac on 2023/4/17.
//  Copyright © 2023 MrShi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, RestrictedInputType) {
    restricted_length,//输入长度限制
    restricted_phone,
    other,
};

typedef void(^ParmeterStrBlock)(NSString *);

@interface RestrictedInputTextField : UITextField
@property(nonatomic,strong)ParmeterStrBlock block;

@property(nonatomic,assign)RestrictedInputType type;
/// 当输入类型是  restricted_length        取值
@property(nonatomic,assign)NSInteger maxLength;


- (instancetype)initKeyBoardStye:(UIKeyboardType)type;

@end

NS_ASSUME_NONNULL_END
