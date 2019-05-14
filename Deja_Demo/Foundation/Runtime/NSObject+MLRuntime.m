//
//  NSObject+MLRuntime.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "NSObject+MLRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (MLRuntime)

+ (void)swizzWithClass:(Class)clazz originSel:(SEL)originSel newSel:(SEL)newSel
{
    Method originM = class_getInstanceMethod(clazz, originSel);
    Method hookM = class_getInstanceMethod(clazz, newSel);
    
    IMP hookImp = method_getImplementation(hookM);
    BOOL addMethodSuccess = class_addMethod(clazz, newSel, hookImp, method_getTypeEncoding(hookM));
    if (addMethodSuccess)
    {
        class_replaceMethod(clazz, originSel, hookImp, method_getTypeEncoding(hookM));
    }
    else
    {
        method_exchangeImplementations(originM, hookM);
    }
}

@end
