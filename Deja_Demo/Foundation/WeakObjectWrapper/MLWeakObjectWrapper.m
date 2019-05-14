//
//  MLWeakObjectWrapper.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLWeakObjectWrapper.h"

@interface MLWeakObjectWrapper ()

@property (nonatomic, weak) id weakObject;

@end

@implementation MLWeakObjectWrapper

- (MLWeakObjectWrapper *)initWithObject:(id)object
{
    self = [super init];
    if (self)
    {
        _weakObject = object;
    }
    return self;
}

+ (MLWeakObjectWrapper *)weakObjectWrapperWithObject:(id)object
{
    return [[[self class] alloc] initWithObject:object];
}

- (id)object
{
    return _weakObject;
}

- (BOOL)isEqual:(id)object
{
    BOOL result = NO;
    do
    {
        if (!_weakObject || !object) { break; }
        if (![object isKindOfClass:[self class]]) { break; }
        
        MLWeakObjectWrapper * typeObject = (MLWeakObjectWrapper *)object;
        result = [[typeObject object] isEqual:_weakObject];
    } while (false);
    
    return result;
}

- (NSUInteger)hash
{
    return _weakObject ? [_weakObject hash] : 0;
}

@end
