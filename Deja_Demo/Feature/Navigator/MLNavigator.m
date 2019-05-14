//
//  MLNavigator.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLNavigator.h"

@implementation MLNavigator

+ (instancetype)sharedInstance
{
    static MLNavigator * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self class] new];
    });
    return instance;
}

+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[[[self class] sharedInstance] rootNavigationController] pushViewController:viewController animated:animated];
}

+ (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    return [[[[self class] sharedInstance] rootNavigationController] popToRootViewControllerAnimated:animated];
}

+ (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [[[[self class] sharedInstance] rootNavigationController] popViewControllerAnimated:animated];
}

+ (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    return [[[[self class] sharedInstance] rootNavigationController] popToViewController:viewController animated:animated];
}

+ (UIWindow *)keyWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

+ (UIView *)keyView
{
    return [[[[self class] sharedInstance] rootNavigationController] view];
}

+ (UITabBarController *)rootTabBarController
{
    UITabBarController * tabBarController = nil;
    UINavigationController * rootNavigationController = [[[self class] sharedInstance] rootNavigationController];
    NSArray <UIViewController *> * viewControllers = [rootNavigationController viewControllers];
    for (UIViewController * viewController in viewControllers)
    {
        if ([viewController isKindOfClass:[UITabBarController class]])
        {
            tabBarController = (UITabBarController *)viewController;
            break;
        }
    }
    return tabBarController;
}

@end
