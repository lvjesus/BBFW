//
//  NSObject+YLSwizzle.m
//  FrameworkDemo
//
//  Created by Bright on 16/4/15.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import "NSObject+YLSwizzle.h"
typedef IMP *IMPPointer;
@implementation NSObject (YLSwizzle)

+ (IMP)swizzleSelector:(SEL)origSelector withIMP:(IMP)newIMP {
    Class class = [self class];
    Method origMethod = class_getInstanceMethod(class,origSelector);
    IMP origIMP = method_getImplementation(origMethod);
    
    if(!class_addMethod(self, origSelector, newIMP,method_getTypeEncoding(origMethod)))
    {
        method_setImplementation(origMethod, newIMP);
    }
    
    return origIMP;
}

//避免了selector的命名冲突。
BOOL class_swizzleMethodAndStore(Class class, SEL original, IMP replacement, IMPPointer store) {
    IMP imp = NULL;
    Method method = class_getInstanceMethod(class, original);
    if (method) {
        const char *type = method_getTypeEncoding(method);
        imp = class_replaceMethod(class, original, replacement, type);
        if (!imp) {
            imp = method_getImplementation(method);
        }
    }
    if (imp && store) { *store = imp; }
    return (imp != NULL);
}

+ (BOOL)swizzle:(SEL)original with:(IMP)replacement store:(IMPPointer)store {
    return class_swizzleMethodAndStore(self, original, replacement, store);
}



@end
