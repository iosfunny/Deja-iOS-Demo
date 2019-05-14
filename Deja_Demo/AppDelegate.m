//
//  AppDelegate.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/13.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "AppDelegate.h"
#import "MLAppInitProcess.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[MLAppInitProcess sharedInstance] application:application beforeFinishLaunchingWithOptions:launchOptions];
    
    UIWindow * window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [window makeKeyAndVisible];
    
    self.window = window;
    
    window.rootViewController = [[MLAppInitProcess sharedInstance] makeRootViewControllerWithLaunchOptions:launchOptions];
    
    [[MLAppInitProcess sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

@end
