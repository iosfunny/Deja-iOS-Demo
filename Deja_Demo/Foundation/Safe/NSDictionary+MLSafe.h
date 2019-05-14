//
//  NSDictionary+MLSafe.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (MLSafe)

- (NSString *_Nullable)mlsafe_stringValueForKey:(NSString *)key;
- (NSArray *_Nullable)mlsafe_arrayValueForKey:(NSString *)key;
- (NSDictionary *_Nullable)mlsafe_dictionaryValueForKey:(NSString *)key;
- (NSNumber *_Nullable)mlsafe_numberValueForKey:(NSString *)key;

- (BOOL)mlsafe_boolValueForKey:(NSString *)key;
- (double)mlsafe_doubleValueForKey:(NSString *)key;
- (NSInteger)mlsafe_integerValueForKey:(NSString *)key;
- (long long)mlsafe_longlongValueForKey:(NSString *)key;
- (int)mlsafe_intValueForKey:(NSString *)key;
- (NSDecimalNumber * _Nullable)mlsafe_decimalNumberForKey:(NSString *)key;

@end

@interface NSMutableDictionary (MLSafe)

- (void)mlsafe_setObject:(id)object forKey:(id<NSCopying>)key;

@end

NS_ASSUME_NONNULL_END
