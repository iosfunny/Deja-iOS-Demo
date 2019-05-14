//
//  MLNextRunloopRunner.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNextRunloopRunner : NSObject

+ (void)run:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
