//
//  NSObject+MLRuntime.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MLRuntime)

+ (void)swizzWithClass:(Class)clazz originSel:(SEL)originSel newSel:(SEL)newSel;

@end

NS_ASSUME_NONNULL_END
