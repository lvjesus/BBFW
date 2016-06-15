//
//  NSObject+YLSwizzle.h
//  FrameworkDemo
//
//  Created by Bright on 16/4/15.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
//Method Swizzling 的封装
@interface NSObject (YLSwizzle)

+ (IMP)swizzleSelector:(SEL)origSelector withIMP:(IMP)newIMP;

@end
