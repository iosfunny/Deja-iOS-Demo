//
//  MLLoginManager.h
//  ProjectBaseService
//
//  Created by mozat on 2019/5/6.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLLoginManager : NSObject

+ (instancetype)sharedInstance;
// 本地校验 ..
- (BOOL)checkLoginStatus;

- (void)showLoginViewControllerIfNeed;

@end

NS_ASSUME_NONNULL_END
