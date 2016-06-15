//
//  validateUtil.h
//  OOMall
//
//  Created by Mac－wuyunlong on 15/11/25.
//  Copyright © 2015年 frank. All rights reserved.
//验证类相关

#import <Foundation/Foundation.h>

@interface ValidateUtil : NSObject

//手机号码验证
+ (BOOL)validatePhone:(NSString *)phone;

//手机加固话判断
+ (BOOL)validateTelePhone:(NSString *)telephone;

//手机验证码 验证 0-9 6位数字
+ (BOOL)validateCode:(NSString *)code;

//邮箱
+ (BOOL) validateEmail:(NSString *)email;

//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;

//车型
+ (BOOL) validateCarType:(NSString *)CarType;

//用户名
+ (BOOL) validateUserName:(NSString *)name;

//密码
+ (BOOL) validatePassword:(NSString *)passWord;

//昵称
+ (BOOL) validateNickname:(NSString *)nickname;

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

@end
