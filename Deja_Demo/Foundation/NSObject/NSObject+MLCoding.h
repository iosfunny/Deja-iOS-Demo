//
//  NSObject+MLCoding.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MLCoding)

- (void)ml_encodeWithCoder:(NSCoder *)aCoder;

- (void)ml_decodeWithCoder:(NSCoder *)aDecoder;

@end

NS_ASSUME_NONNULL_END
