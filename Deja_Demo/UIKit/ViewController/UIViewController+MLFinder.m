//
//  UIViewController+MLFinder.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "UIViewController+MLFinder.h"

@implementation UIViewController (MLFinder)

- (UIViewController *)ml_findCustomTopViewController
{
    if ([self isKindOfClass:[UINavigationController class]])
    {
        UINavigationController * navigationController = (UINavigationController *)self;
        if (navigationController.visibleViewController)
        {
            return [navigationController.visibleViewController ml_findCustomTopViewController];
        }
        return navigationController;
    }
    else if ([self isKindOfClass:[UITabBarController class]])
    {
        UITabBarController * tabBarController = (UITabBarController *)self;
        if (tabBarController.selectedViewController)
        {
            return [tabBarController.selectedViewController ml_findCustomTopViewController];
        }
        return tabBarController;
    }
    
    return self;
}

- (void)updateNavigationItem:(UINavigationItem *)navigationItem
{
    navigationItem.title = self.navigationItem.title;
    navigationItem.leftBarButtonItem = self.navigationItem.leftBarButtonItem;
    navigationItem.rightBarButtonItem = self.navigationItem.rightBarButtonItem;
    navigationItem.titleView = self.navigationItem.titleView;
}

@end
