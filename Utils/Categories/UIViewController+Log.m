//
//  UIViewController+Log.m
//  MCF2
//
//  Created by Mac－wuyunlong on 15/8/3.
//  Copyright (c) 2015年 ac. All rights reserved.
//

#import "UIViewController+Log.h"
#import <objc/runtime.h>
@implementation UIViewController (Log)

#if DEBUG
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(before_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class,originalSelector, method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,swizzledSelector,method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)before_viewWillAppear:(BOOL)animated {
    
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n-----------------------------------\n\n当前类名：---->  %@\n\n-----------------------------------",NSStringFromClass([self class]));;
    [self before_viewWillAppear:animated];//此方法实际上调用的是viewWillAppear:方法
}


//- (void)viewWillAppear:(BOOL)animated
//{
//    
//    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n-----------------------------------\n\n当前类名：---->  %@\n\n-----------------------------------",NSStringFromClass([self class]));
//    
//}

#endif

@end
