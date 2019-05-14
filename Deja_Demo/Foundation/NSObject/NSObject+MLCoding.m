//
//  NSObject+MLCoding.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "NSObject+MLCoding.h"
#import <objc/runtime.h>

@implementation NSObject (MLCoding)

+ (NSArray<NSString *> *)propertyNames
{
    unsigned int outCount;
    objc_property_t * propertys = class_copyPropertyList(self, &outCount);
    NSMutableArray * propertyNames = [NSMutableArray arrayWithCapacity:outCount];
    for (int i = 0; i < outCount; i ++)
    {
        objc_property_t property = propertys[i];
        const char * propertyName_c = property_getName(property);
        NSString * propertyName_oc = [NSString stringWithUTF8String:propertyName_c];
        [propertyNames addObject:propertyName_oc];
    }
    
    free(propertys);
    
    return propertyNames;
}

- (void)ml_encodeWithCoder:(NSCoder *)aCoder
{
    NSArray<NSString *> * propertyNames = [[self class] propertyNames];
    for (NSString * propertyName in propertyNames)
    {
        id value = [self valueForKey:propertyName];
        if (value && [value conformsToProtocol:@protocol(NSCoding)])
        {
            objc_property_t property = class_getProperty([self class], [propertyName UTF8String]);
            const char * attr_cStr = property_getAttributes(property);
            NSString * attr_ocStr = [NSString stringWithUTF8String:attr_cStr];
            NSArray * attrArr = [attr_ocStr componentsSeparatedByString:@","];
            BOOL shouldEnCode = NO;
            if (attrArr.count > 1)
            {
                NSString * attr = [attrArr objectAtIndex:1];
                BOOL isReadOnly = [attr isEqualToString:@"R"];
                BOOL isWeak = [attr isEqualToString:@"W"];
                shouldEnCode = !(isReadOnly || isWeak);
            }
            
            if (shouldEnCode)
            {
                [aCoder encodeObject:value forKey:propertyName];
            }
        }
    }
}

- (void)ml_decodeWithCoder:(NSCoder *)aDecoder
{
    NSArray<NSString *> * propertyNames = [[self class] propertyNames];
    for (NSString * propertyName in propertyNames)
    {
        id value = [aDecoder decodeObjectForKey:propertyName];
        if (value)
        {
            //  Property Attribute Description Examples
            objc_property_t property = class_getProperty([self class], [propertyName UTF8String]);
            const char * attr_cStr = property_getAttributes(property);
            NSString * attr_ocStr = [NSString stringWithUTF8String:attr_cStr];
            NSArray * attrArr = [attr_ocStr componentsSeparatedByString:@","];
            BOOL hasKeyToSetValue = NO;
            if (attrArr.count > 1)
            {
                NSString * attr = [attrArr objectAtIndex:1];
                BOOL isReadOnly = [attr isEqualToString:@"R"];
                hasKeyToSetValue = !isReadOnly;
            }
            
            if (hasKeyToSetValue)
            {
                [self setValue:value forKey:propertyName];
            }
        }
    }
}

@end
