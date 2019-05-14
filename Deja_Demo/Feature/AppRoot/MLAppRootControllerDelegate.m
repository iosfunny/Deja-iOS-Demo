//
//  MLAppRootControllerDelegate.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLAppRootControllerDelegate.h"
#import "UIViewController+MLFinder.h"

@implementation MLAppRootControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [viewController updateNavigationItem:tabBarController.navigationItem];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
}

@end
