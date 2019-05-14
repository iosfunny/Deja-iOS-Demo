//
//  MLAppInitProcess.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLAppInitProcess : NSObject

+ (instancetype)sharedInstance;

- (UIViewController *)makeRootViewControllerWithLaunchOptions:(NSDictionary *)launchOptions;

- (void)application:(UIApplication *)application beforeFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
