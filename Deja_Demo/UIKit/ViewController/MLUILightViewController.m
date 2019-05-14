//
//  MLUILightViewController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUILightViewController.h"
#import "UIViewController+MLNavigationItem.h"
#import "UIViewController+MLFinder.h"

@interface MLUILightViewController ()

@property (nonatomic, strong) UIView * lightBarBGView;

@end

@implementation MLUILightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.titleView = self.customTitleView;
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    [self.customTitleView setNeedsLayout];
}

- (UIColor *)navigationBarTintColor
{
    return [UIColor blackColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (UIView *)featureNavigationBarBGView
{
    return self.lightBarBGView;
}

- (UIView *)lightBarBGView
{
    if (!_lightBarBGView)
    {
        _lightBarBGView = [[UIView alloc] init];
        _lightBarBGView.backgroundColor = [UIColor whiteColor];
    }
    return _lightBarBGView;
}

@end
