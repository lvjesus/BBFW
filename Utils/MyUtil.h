//
//  MyUtil.h
//  Dcc.mc.cc
//
//  Created by Mac－wuyunlong on 15/3/25.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyUtil : NSObject

//-----------------------------------------------------------------

/**
 *  自动获取宽度
 */
+ (CGFloat)getWidthWithFont:(UIFont *)font  height:(CGFloat)height text:(NSString *)text;
/**
 *  自动获取高度
 */
+ (CGFloat)getHeightWithFont:(UIFont *)font  with:(CGFloat)with text:(NSString *)text;

/**
 *  修改文字的属性 颜色 字体 范围
 */
+ (NSMutableAttributedString *)getAttributedWithString:(NSString *)string Color:(UIColor *)color font:(UIFont *)font range:(NSRange)range;

/** 分割线 */
+ (UIView *)createLineWithFrame:(CGRect)frame color:(UIColor *)color WithBgView:(UIView *)bgView;


//-----------------------------------------------------------------
//                      针对本App封装的类方法
//-----------------------------------------------------------------


//根据服务器返回的字符串转换成到秒的时间戳
+ (double)getTimeStampFormTimeString:(NSString *)timeStr;

/**
 *  提示框
 *
 *  @param message 提示信息
 */
+ (void)showAlertMessage:(NSString *)message;

//自消失提示框
+(void)showAutoDisappearInfo:(NSString *)info center:(CGPoint)point;

/**
 *  打电话
 *
 *  @param number 手机号
 *  @param view   父视图 一般为 self.View
 */
+ (void)MakeAPhoneCallWithTelephoneNumber:(NSString *)number withBgView:(UIView *)view;

/**
 *  服务器返回的时间转换
 *
 *  @param string 时间字符串
 *
 *  @return 格式化好的时间
 */
+ (NSString *)dateTimeWithString:(NSString *)string;

/**
 *  服务器返回的时间转换
 *
 *  @param string 时间字符串
 *
 *  @return 格式化好的时间yy-MM-dd HH:mm:ss
 */
+ (NSString *)dateTimeWithAllString:(NSString *)string;

/**
 *  服务器返回的时间转换
 *
 *  @param string 时间字符串
 *
 *  @return 格式化好的时间
 */
+ (NSString *)dateTimeWithOnlyDateString:(NSString *)string;

/**
 *  随机生成汉字
 *
 *  @return <#return value description#>
 */
+ (NSString *)getChineseWithrandom;
/**
 *  随机生成日期
 *
 *  @return <#return value description#>
 */
+ (NSString*)getTimeAndRandom;

/**
 *  对数组—Model-属性 进行排序
 *
 *  @param dataArray 要排序的数组
 *  @param string    要排序的属性
 *
 *  @return 排序的数组
 */
+ (NSArray *)sortWithArray:(NSArray *)dataArray WithProperty:(NSString *)string;

/**
 *  隐藏手机号码中间四位
 *
 *  @param phone 手机号码
 *
 *  @return 隐藏后的手机号码
 */
+ (NSString *)hidePhoneNumberWithNumber:(NSString *)phone;


+ (NSString *)encodeToPercentEscapeString: (NSString *) input;

+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;
/**
 *  创建Label 类工厂方法
 *
 *  @param frame         <#frame description#>
 *  @param text          <#text description#>
 *  @param color         <#color description#>
 *  @param font          <#font description#>
 *  @param numberOfLines <#numberOfLines description#>
 *  @param textAlignment <#textAlignment description#>
 *
 *  @return <#return value description#>
 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text color:(UIColor *)color font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines textAlignment:(NSTextAlignment)textAlignment;

/**
 *  修改视图某一个角为圆角
 *
 *  @param view        视图
 *  @param corners     指定哪一个角
 *  @param cornerRadii 角的尺寸
 */
+ (UIView *)changeView:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;


@end
