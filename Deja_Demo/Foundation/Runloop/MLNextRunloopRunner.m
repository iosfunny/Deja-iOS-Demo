//
//  MLNextRunloopRunner.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLNextRunloopRunner.h"

@interface MLNextRunloopRunner ()

@property (nonatomic, copy) void(^block)(void);

@end

@implementation MLNextRunloopRunner

- (void)dealloc
{
    if (_block) { _block(); }
}

- (instancetype)initWithRunnerBlock:(void(^)(void))block
{
    self = [super init];
    if (self)
    {
        self.block = block;
    }
    return self;
}

+ (instancetype)runnerWithBlock:(void(^)(void))block
{
    MLNextRunloopRunner * runner = [[[self class] alloc] initWithRunnerBlock:block];
    
    return runner;
}

+ (void)run:(void (^)(void))block
{
    __unused MLNextRunloopRunner * runner = [self runnerWithBlock:block];
}

@end
