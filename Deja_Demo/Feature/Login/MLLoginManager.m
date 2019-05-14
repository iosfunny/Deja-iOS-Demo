//
//  MLLoginManager.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/6.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLLoginManager.h"
#import "MLUILoginViewController.h"

@implementation MLLoginManager

+ (instancetype)sharedInstance
{
    static MLLoginManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self class] new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (BOOL)checkLoginStatus
{
    BOOL res = NO;
    
    return res;
}

- (void)showLoginViewControllerIfNeed
{
    if (![self checkLoginStatus])
    {
        
    }
}

@end
