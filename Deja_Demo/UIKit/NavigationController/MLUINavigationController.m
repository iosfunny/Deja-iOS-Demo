//
//  MLUINavigationController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUINavigationController.h"
#import "MLTransparentNavigationBar.h"
#import "MLNextRunloopRunner.h"

@interface MLUINavigationController () <UINavigationBarDelegate>

@end

@implementation MLUINavigationController

+ (MLUINavigationController *)navigationControllerWithRootViewController:(UIViewController *)rootViewController
{
    MLUINavigationController * navigationController = [[MLUINavigationController alloc] initWithNavigationBarClass:[MLTransparentNavigationBar class]
                                                                                                      toolbarClass:[UIToolbar class]];
    if ([rootViewController isKindOfClass:[UIViewController class]])
    {
        [navigationController pushViewController:rootViewController animated:NO];
    }
    
    return navigationController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.visibleViewController;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.visibleViewController preferredStatusBarStyle];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    if ([self.viewControllers count] < [navigationBar.items count])
    {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController * viewController = [self topViewController];
    shouldPop = [viewController navigationShouldPopOnBackButton];
    if (!shouldPop)
    {
        return NO;
    }
    
    [MLNextRunloopRunner run:^{
        [self popViewControllerAnimated:YES];
    }];
    
    return YES;
}

@end

@implementation UIViewController (MLUINavigationController)

- (BOOL)navigationShouldPopOnBackButton
{
    return YES;
}

@end
