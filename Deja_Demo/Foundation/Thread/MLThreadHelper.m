//
//  MLThreadHelper.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLThreadHelper.h"

@implementation MLThreadHelper

+ (void)doActionInMainThread:(void (^)(void))action
{
    if ([[NSThread currentThread] isMainThread])
    {
        if (action) { action(); }
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (action) { action(); }
        });
    }
}

@end
