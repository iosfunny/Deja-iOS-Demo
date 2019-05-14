//
//  MLProxy.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLProxy.h"

@interface MLProxy ()

@property (nonatomic, weak) id target;

@end

@implementation MLProxy

+ (instancetype)proxyWithTarget:(id)target
{
    MLProxy * proxy = [MLProxy alloc];
    proxy.target = target;
    
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [self.target methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}

@end
