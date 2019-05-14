//
//  NSArray+MLSafe.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray <ObjectType> (MLSafe)

- (ObjectType)mlsafe_objectAtIndex:(NSInteger)index;

@end

@interface NSMutableArray <ObjectType> (MLSafe)

- (void)mlsafe_addObject:(ObjectType)object;

@end

NS_ASSUME_NONNULL_END
