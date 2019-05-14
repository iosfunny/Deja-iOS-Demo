//
//  MLLanguageHelper.h
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLLanguageHelper : NSObject

+ (instancetype)helper;

- (void)initLanguage;
- (BOOL)isRTL;

@end

NS_ASSUME_NONNULL_END
