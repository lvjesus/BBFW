//
//  MyTextView.m
//  CRM
//
//  Created by Mac－wuyunlong on 15/7/14.
//  Copyright (c) 2015年 hong. All rights reserved.
//

#import "MyTextView.h"

@implementation MyTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化
        _contentColor = [UIColor blackColor];
        _placeholderColor = [UIColor lightGrayColor];
        _editing = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    }
    return self;
}

#pragma mark - super

- (void)setTextColor:(UIColor *)textColor
{
    [super setTextColor:textColor];
    
    _contentColor = textColor;
}

- (NSString *)text
{
    if ([super.text isEqualToString:_placeholder] && super.textColor == _placeholderColor) {
        return @"";
    }
    
    return [super text];
}

- (void)setText:(NSString *)string
{
    
    super.textColor = _contentColor;
    [super setText:string];
    
    [self setPlaceholder:_placeholder];
}

#pragma mark - setting

- (void)setPlaceholder:(NSString *)string
{
    _placeholder = string;
    
    [self finishEditing:nil];
}

- (void)setPlaceholderColor:(UIColor *)color
{
    _placeholderColor = color;
}

#pragma mark - notification

- (void)startEditing:(NSNotification *)notification
{
    _editing = YES;
    
    if ([super.text isEqualToString:_placeholder] && super.textColor == _placeholderColor) {
        super.textColor = _contentColor;
        super.text = @"";
    }
}

- (void)finishEditing:(NSNotification *)notification
{
    _editing = NO;
    
    if (super.text == nil || super.text.length == 0) {
        super.textColor = _placeholderColor;
        super.text = _placeholder;
    }
    else{
        super.textColor = _contentColor;
    }
}


@end
