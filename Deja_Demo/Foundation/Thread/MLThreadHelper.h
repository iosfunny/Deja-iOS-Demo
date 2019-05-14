//
//  MLThreadHelper.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLThreadHelper : NSObject

+ (void)doActionInMainThread:(void(^)(void))action;

@end

NS_ASSUME_NONNULL_END
