//
//  RestrictedInputTextField.m
//  MiGuo
//
//  Created by mac on 2023/4/17.
//  Copyright © 2023 MrShi. All rights reserved.
//

#import "RestrictedInputTextField.h"
#import "ZYFHUDManager.h"

#define OCZYFHUD [ZYFHUDManager sharedHUDManager]

@interface RestrictedInputTextField()<UITextFieldDelegate>

@end
@implementation RestrictedInputTextField

- (instancetype)initKeyBoardStye:(UIKeyboardType)type
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.type = other;
        self.keyboardType = type;
        [self addTarget:self action:@selector(textFieldDidChangeSelection:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}
- (void)setType:(RestrictedInputType)type{
    _type = type;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //返回输入内容
    NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    NSString *content = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (self.type == restricted_length){
        //根据限制条件  是否禁止输入
        if (str.length>self.maxLength){
            [OCZYFHUD showWithMessage:@"输入超限"];
            return NO;
        }
    }
    // 手机号码  限制只能输入手机号
    if (self.type == restricted_phone){
        //写法 一
//        if([string isEqualToString:@""]){
//            return YES;
//        }
//        if(textField.text.length >= 11){
//            [OCZYFHUD showWithMessage:@"请输入正确手机号"];
//            return NO;
//        }
//        if(textField.text.length == 0 && ![string isEqualToString:@"1"]){
//            [OCZYFHUD showWithMessage:@"请输入正确手机号"];
//            return NO;
//        }
//        if(textField.text.length == 1 && ![string isEqualToString:@"3"] && ![string isEqualToString:@"4"]&& ![string isEqualToString:@"5"]&& ![string isEqualToString:@"6"]&& ![string isEqualToString:@"7"]&& ![string isEqualToString:@"8"]&& ![string isEqualToString:@"9"]){
//            [OCZYFHUD showWithMessage:@"请输入正确手机号"];
//            return NO;
//        }
//        if (string.length == 0){
//            return YES;
//        }
//        if(str.length > 11){
//            return NO;
//        }
        
        //写法 二
        if ([string isEqualToString:@""]){
            return YES;
        }
        BOOL isphone = [self isInputIngMobile:str];
        if (isphone == NO){
            [OCZYFHUD showWithMessage:@"请输入正确的11位手机号"];
            return NO;
        }
    }
    
    return YES;
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    if([self isValidateMobile:textField.text]){
        if (self.block != nil) {
            self.block(textField.text);
        }
    }else{
        [OCZYFHUD showWithMessage:@"请输入正确的11位手机号"];
    }
}

- (void)textFieldDidChangeSelection:(UITextField *)textField{
    
}

#pragma mark - 手机号码验证

//逐步判断输入的是否为手机号     区别于手机号正则  @"^1[3456789]\\d{9}$";
-(BOOL)isInputIngMobile:(NSString *)mobile {
    NSString *phoneRegex = @"^1([3456789]\\d{0,9})?$";
    NSPredicate *phone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phone evaluateWithObject:mobile];
}

-(BOOL)isValidateMobile:(NSString *)mobile {
    NSString *phoneRegex = @"^1[3-9]\\d{9}$";
    NSPredicate *phone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phone evaluateWithObject:mobile];
}
@end
