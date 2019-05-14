//
//  NSString+MLURLCode.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MLURLCode)

- (NSString *)ml_urlEncodeString;
- (NSString *)ml_urlDecodeString;

@end

NS_ASSUME_NONNULL_END
