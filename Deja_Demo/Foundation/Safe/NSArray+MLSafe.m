//
//  NSArray+MLSafe.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "NSArray+MLSafe.h"

@implementation NSArray (MLSafe)

- (id)mlsafe_objectAtIndex:(NSInteger)index
{
    id object = nil;
    if (self.count > index)
    {
        object = [self objectAtIndex:index];
    }
    assert(object);
    return object;
}

@end

@implementation NSMutableArray (MLSafe)

- (void)mlsafe_addObject:(id)object
{
    assert(object);
    if (object)
    {
        [self addObject:object];
    }
}

@end
