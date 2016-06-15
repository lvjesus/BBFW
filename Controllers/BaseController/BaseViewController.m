//
//  BaseViewController.m
//  FrameworkDemo
//
//  Created by Bright on 16/4/1.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithBaseParams];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)initWithBaseParams
{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f8f8f8"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self dismissForKeyboard];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
