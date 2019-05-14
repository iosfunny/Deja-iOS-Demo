//
//  NSString+MLJSON.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MLJSON)

/*
 object只支持NSDictionary类型 !!!
 */
+ (NSString *)ml_jsonStringWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
