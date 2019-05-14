//
//  NSString+MLJSON.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "NSString+MLJSON.h"

@implementation NSString (MLJSON)

+ (NSString *)ml_jsonStringWithObject:(id)object
{
    if (![object isKindOfClass:[NSDictionary class]]) return nil;
    
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
    NSString * jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

@end
