//
//  MLLanguageHelper.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLLanguageHelper.h"

@implementation MLLanguageHelper

+ (instancetype)helper
{
    static MLLanguageHelper * helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[self class] new];
    });
    return helper;
}

- (void)initLanguage
{
    
}

- (BOOL)isRTL
{
    // 默认非阿语环境. 
    return NO;
}

@end
