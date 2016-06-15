//
//  MyUtil.m
//  Dcc.mc.cc
//
//  Created by Mac－wuyunlong on 15/3/25.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import "MyUtil.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation MyUtil

//-----------------------------------------------------------------

+ (CGFloat)getWidthWithFont:(UIFont *)font  height:(CGFloat)height text:(NSString *)text
{
    NSDictionary *attr = @{NSFontAttributeName : font};
    CGFloat width = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                       options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                    attributes:attr
                                       context:nil].size.width;
    return width;
}

+ (CGFloat)getHeightWithFont:(UIFont *)font  with:(CGFloat)with text:(NSString *)text
{
    NSDictionary *attr = @{NSFontAttributeName : font};
    CGFloat height = [text boundingRectWithSize:CGSizeMake(with, MAXFLOAT)
                                        options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                     attributes:attr
                                        context:nil].size.height;
    return height;
}


#pragma mark-----------时间转换--------------------

+ (double)getTimeStampFormTimeString:(NSString *)timeStr
{
    NSArray *arr1 = [timeStr componentsSeparatedByString:@"("];
    if (arr1.count>1) {
        NSString *str1 = [arr1 objectAtIndex:1];
        NSArray *arr2 = [str1 componentsSeparatedByString:@"+"];
        if (arr2.count>0) {
            NSString *tStr = [arr2 objectAtIndex:0];
            return [tStr doubleValue]/1000;
        }
        else
        {
            NSArray *arr3 = [str1 componentsSeparatedByString:@"-"];
            if (arr3.count>0) {
                NSString *tStr = [arr3 objectAtIndex:0];
                return [tStr doubleValue]/1000;
            }
        }
    }
    return 0.0;
}


+ (NSMutableAttributedString *)getAttributedWithString:(NSString *)string Color:(UIColor *)color font:(UIFont *)font range:(NSRange)range
{
    NSMutableAttributedString *strAttributed = [[NSMutableAttributedString alloc] initWithString:string];
    [strAttributed addAttribute:NSForegroundColorAttributeName value:color range:range];
    [strAttributed addAttribute:NSFontAttributeName value:font range:range];
    return strAttributed;
}


/** 分割线 */
+ (UIView *)createLineWithFrame:(CGRect)frame color:(UIColor *)color WithBgView:(UIView *)bgView
{
    UIView *line = [[UIView alloc]init];
    line.frame = frame;
    line.backgroundColor = color;
    [bgView addSubview:line];
    return line;
}

+ (void)showAlertMessage:(NSString *)message
{
    if (!message || message.length == 0) {
        return;
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"友情提醒" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了",nil];
    [alert show];
}

+(void)showAutoDisappearInfo:(NSString *)info center:(CGPoint)point{
    if (info && info.length>0) {
        CGFloat strW = [MyUtil getWidthWithFont:[UIFont systemFontOfSize:14.0] height:30 text:info];
        if (strW > kSCREENWIDTH/2) {
            strW = kSCREENWIDTH/2;
        }
        
        CGFloat strH = [MyUtil getHeightWithFont:[UIFont systemFontOfSize:14.0] with:strW text:info];
        if (strH < 30) {
            strH = 30;
        }
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, strW+20, strH)];
        backView.backgroundColor = [UIColor colorWithRed:87 green:87 blue:87 alpha:1.0];
        backView.layer.cornerRadius = 5;
        backView.layer.masksToBounds = YES;
        backView.center = point;
        [[UIApplication sharedApplication].keyWindow addSubview:backView];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, strW, strH)];
        lab.backgroundColor = [UIColor clearColor];
        lab.font = [UIFont systemFontOfSize:14];
        lab.textColor = [UIColor whiteColor];
        lab.text = info;
        [backView addSubview:lab];
        lab.center = CGPointMake(backView.width/2, backView.height/2);
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
            backView.alpha = 0;
        } completion:^(BOOL finished) {
            [backView removeFromSuperview];
        }];
    }
}


/**
 *  打电话
 *
 *  @param number 手机号
 *  @param view   父视图 一般为 self.View
 */
+ (void)MakeAPhoneCallWithTelephoneNumber:(NSString *)number withBgView:(UIView *)view
{
    UIWebView  *callWebView = [[UIWebView alloc]init];
    NSURL *telUrl = [NSURL URLWithString: [NSString stringWithFormat:@"tel:%@",number]];
    [callWebView loadRequest:[NSURLRequest requestWithURL:telUrl]];
    [view addSubview:callWebView];
}

/**
 *  服务器返回的时间转换
 *
 *  @param string 时间字符串
 *
 *  @return 格式化好的时间
 */
+ (NSString *)dateTimeWithString:(NSString *)string
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[MyUtil getTimeStampFormTimeString:string]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yy-MM-dd HH:mm"];
    NSString *dateTimeStr = [dateFormat stringFromDate:date];
    
    return dateTimeStr;
    
}

+ (NSString *)dateTimeWithAllString:(NSString *)string
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[MyUtil getTimeStampFormTimeString:string]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSString *dateTimeStr = [dateFormat stringFromDate:date];
    
    return dateTimeStr;
    
}

/**
 *  服务器返回的时间转换
 *
 *  @param string 时间字符串
 *
 *  @return 格式化好的时间
 */
+ (NSString *)dateTimeWithOnlyDateString:(NSString *)string
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[MyUtil getTimeStampFormTimeString:string]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTimeStr = [dateFormat stringFromDate:date];
    
    return dateTimeStr;
    
}

/**
 *  随机生成汉字
 *
 *  @return <#return value description#>
 */
+ (NSString *)getChineseWithrandom
{
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSInteger randomH = 0xA1+arc4random()%(0xFE - 0xA1+1);
    
    NSInteger randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1);
    
    NSInteger number = (randomH<<8)+randomL;
    
    NSData *data = [NSData dataWithBytes:&number length:2];
    
    NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
    
    NSLog(@"%@",string);
    
    return string;
    
}

/**
 *  随机生成日期
 *
 *  @return <#return value description#>
 */
+ (NSString*)getTimeAndRandom
{
    int iRandom=arc4random()%31;
    if (iRandom<0) {
        iRandom=-iRandom;
    }
    
    NSDateFormatter *tFormat=[[NSDateFormatter alloc] init];
    [tFormat setDateFormat:@"yyyy-MM"];
    NSString *tResult=[NSString stringWithFormat:@"%@-%.2d",[tFormat stringFromDate:[NSDate date]],iRandom];
    NSLog(@"%@",tResult);
    return tResult;
}

/**
 *  对数组—Model-属性 进行排序
 *
 *  @param dataArray 要排序的数组
 *  @param string    要排序的属性
 *
 *  @return 排序的数组
 */
+ (NSArray *)sortWithArray:(NSArray *)dataArray WithProperty:(NSString *)string
{
    NSSortDescriptor*sorter=[[NSSortDescriptor alloc]initWithKey:string ascending:YES];
    NSMutableArray *sortDescriptors=[[NSMutableArray alloc]initWithObjects:&sorter count:1];
    NSArray *sortArray=[dataArray sortedArrayUsingDescriptors:sortDescriptors];
    return sortArray;
}

/**
 *  隐藏手机号码中间四位
 *
 *  @param phone 手机号码
 *
 *  @return 隐藏后的手机号码
 */
+ (NSString *)hidePhoneNumberWithNumber:(NSString *)phone
{
    if (phone.length>10) {
        NSString *tel = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        return tel;
    }
    return nil;
    
}


+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                              (CFStringRef)input,
                                                                              NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8));
    return outputStr;
}

+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text color:(UIColor *)color font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    if (text)
    {
        label.text = text;
    }
    
    if (font)
    {
        label.font = font;
    }
    
    if (color)
    {
        label.textColor = color;
    }
    
    if (numberOfLines >= 0)
    {
        label.numberOfLines = numberOfLines;
    }
    if (textAlignment)
    {
        label.textAlignment = textAlignment;
    }
    
    return label;
}


/**
 *  修改视图某一个角为圆角
 *
 *  @param view        视图
 *  @param corners     指定哪一个角
 *  @param cornerRadii 角的尺寸
 */
+ (UIView *)changeView:(UIView *)view byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    return view;
}



@end
