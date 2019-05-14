//
//  MLAppRootController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLAppRootController.h"
#import "UIViewController+MLFinder.h"
#import "MLUIViewController.h"

#import "MLUILookbookViewController.h"
#import "MLMeViewController.h"

@interface MLAppRootController ()

@end

@implementation MLAppRootController

- (UITabBarItem *)tabBarItemWithTitle:(NSString *_Nullable)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UIColor * normalColor = [UIColor blackColor];
    UIColor * selectedColor = [UIColor redColor];
    
    NSDictionary * textAttributesNormal = @{ NSForegroundColorAttributeName : normalColor };
    NSDictionary * textAttributesSelected = @{ NSForegroundColorAttributeName : selectedColor };
    
    UITabBarItem * tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    [tabBarItem setTitleTextAttributes:textAttributesNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:textAttributesSelected forState:UIControlStateSelected];
    
    if (title.length == 0)
    {
        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, - 6, 0); // 居中 
    }
    
    return tabBarItem;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        UIImage * normalImage = nil;
        UIImage * selectedImage = nil;
        
        MLUILookbookViewController * homepage = [[MLUILookbookViewController alloc] init];
        normalImage = [resGetImage(@"TabBarIcon/homepage_normal.png") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [resGetImage(@"TabBarIcon/homepage_selected.png") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem * homepageItem = [self tabBarItemWithTitle:resGetLocalizedString(@"Lookbook") image:normalImage selectedImage:selectedImage];
        homepage.tabBarItem = homepageItem;
        
        MLUIViewController * discover = [[MLUIViewController alloc] init];
        normalImage = [resGetImage(@"TabBarIcon/discover_normal.png") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [resGetImage(@"TabBarIcon/discover_selected.png") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem * discoverItem = [self tabBarItemWithTitle:resGetLocalizedString(@"Shop") image:normalImage selectedImage:selectedImage];
        discover.tabBarItem = discoverItem;
        
        MLMeViewController * me = [[MLMeViewController alloc] init];
        normalImage = [resGetImage(@"TabBarIcon/me_normal.png") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        selectedImage = [resGetImage(@"TabBarIcon/me_selected.png") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem * meItem = [self tabBarItemWithTitle:resGetLocalizedString(@"Me") image:normalImage selectedImage:selectedImage];
        me.tabBarItem = meItem;
        
        [self.tabBar setTranslucent:NO];
        
        NSMutableArray <UIViewController *> * viewControllers = [NSMutableArray array];
        [viewControllers addObject:homepage];
        [viewControllers addObject:discover];
        [viewControllers addObject:me];
        
        [self setViewControllers:viewControllers];
        
        [homepage updateNavigationItem:self.navigationItem];
    }
    return self;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.selectedViewController;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.selectedViewController preferredStatusBarStyle];
}

- (NSString *)title
{
    NSString * title = [self ml_findCustomTopViewController].title;
    
    return title ?: @"";
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController
{
    [super setSelectedViewController:selectedViewController];
    [self updateNavigationBarWithController:selectedViewController];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    UIViewController * selectedViewController = [self selectedViewController];
    [self updateNavigationBarWithController:selectedViewController];
}

- (void)updateNavigationBarWithController:(UIViewController *)viewController
{
    self.title = self.title;
    [viewController updateNavigationItem:self.navigationItem];
}

@end
