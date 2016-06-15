//
//  MyTextView.h
//  CRM
//
//  Created by Mac－wuyunlong on 15/7/14.
//  Copyright (c) 2015年 hong. All rights reserved.
//带占位文字的textView

#import <UIKit/UIKit.h>

@interface MyTextView : UITextView
{
    UIColor *_contentColor;
    BOOL _editing;
}

@property(strong, nonatomic) NSString *placeholder;
@property(strong, nonatomic) UIColor *placeholderColor;

@end
