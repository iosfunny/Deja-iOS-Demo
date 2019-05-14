//
//  NSDictionary+MLSafe.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "NSDictionary+MLSafe.h"

@implementation NSDictionary (MLSafe)

- (id)dataForKey:(NSString *)key
{
    return key ? [self objectForKey:key] : nil;
}

- (id)dataForKey:(NSString *)key dataClass:(Class)dataClass
{
    id data = [self dataForKey:key];
    assert((data == nil || [data isKindOfClass:dataClass] || [data isKindOfClass:[NSNull class]]));
    return [data isKindOfClass:dataClass] ? data : nil;
}

- (NSString *)mlsafe_stringValueForKey:(NSString *)key
{
    return [self dataForKey:key dataClass:[NSString class]];
}

- (NSArray *)mlsafe_arrayValueForKey:(NSString *)key
{
    return [self dataForKey:key dataClass:[NSArray class]];
}

- (NSDictionary *)mlsafe_dictionaryValueForKey:(NSString *)key
{
    return [self dataForKey:key dataClass:[NSDictionary class]];
}

- (NSNumber *)mlsafe_numberValueForKey:(NSString *)key
{
    return [self dataForKey:key dataClass:[NSNumber class]];
}

- (BOOL)mlsafe_boolValueForKey:(NSString *)key
{
    id data = [self dataForKey:key];
    assert(data == nil || [data respondsToSelector:@selector(boolValue)] || [data isKindOfClass:[NSNull class]]);
    if ([data respondsToSelector:@selector(boolValue)])
    {
        return [data boolValue];
    }
    return NO;
}

- (int)mlsafe_intValueForKey:(NSString *)key
{
    id data = [self dataForKey:key];
    assert(data == nil || [data respondsToSelector:@selector(intValue)] || [data isKindOfClass:[NSNull class]]);
    if ([data respondsToSelector:@selector(intValue)])
    {
        return [data intValue];
    }
    return 0;
}

- (double)mlsafe_doubleValueForKey:(NSString *)key
{
    id data = [self dataForKey:key];
    assert(data == nil || [data respondsToSelector:@selector(doubleValue)] || [data isKindOfClass:[NSNull class]]);
    if ([data respondsToSelector:@selector(doubleValue)])
    {
        return [data doubleValue];
    }
    return 0.f;
}

- (NSInteger)mlsafe_integerValueForKey:(NSString *)key
{
    id data = [self dataForKey:key];
    assert(data == nil || [data respondsToSelector:@selector(integerValue)] || [data isKindOfClass:[NSNull class]]);
    if ([data respondsToSelector:@selector(integerValue)])
    {
        return [data integerValue];
    }
    return 0;
}

- (long long)mlsafe_longlongValueForKey:(NSString *)key
{
    id data = [self dataForKey:key];
    assert(data == nil || [data respondsToSelector:@selector(longLongValue)] || [data isKindOfClass:[NSNull class]]);
    if ([data respondsToSelector:@selector(longLongValue)])
    {
        return [data longLongValue];
    }
    return 0;
}

- (NSDecimalNumber *)mlsafe_decimalNumberForKey:(NSString *)key
{
    id data = [self dataForKey:key];
    assert(data == nil || [data isKindOfClass:[NSString class]] || [data isKindOfClass:[NSNumber class]] || [data isKindOfClass:[NSNull class]]);
    if ([data isKindOfClass:[NSString class]] || [data isKindOfClass:[NSNumber class]])
    {
        return [NSDecimalNumber decimalNumberWithString:[data description]];
    }
    return nil;
}

@end


@implementation NSMutableDictionary (MLSafe)

- (void)mlsafe_setObject:(id)object forKey:(id<NSCopying>)key
{
    if (object)
    {
        [self setObject:object forKey:key];
    }
}

@end
