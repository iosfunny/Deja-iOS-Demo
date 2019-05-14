//
//  MLNavigator.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNavigator : NSObject

@property (nonatomic, weak) UINavigationController * rootNavigationController;

+ (instancetype)sharedInstance;
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (NSArray <UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated;
+ (UIViewController *)popViewControllerAnimated:(BOOL)animated;
+ (NSArray <UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (UIWindow *)keyWindow;
+ (UIView *)keyView;
+ (UITabBarController *)rootTabBarController;

@end

NS_ASSUME_NONNULL_END
