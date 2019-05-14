//
//  MLWeakObjectWrapper.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLWeakObjectWrapper <ObjectType> : NSObject

- (MLWeakObjectWrapper<ObjectType> *)initWithObject:(ObjectType)object;
+ (MLWeakObjectWrapper<ObjectType> *)weakObjectWrapperWithObject:(ObjectType)object;

- (ObjectType)object;

@end

NS_ASSUME_NONNULL_END
