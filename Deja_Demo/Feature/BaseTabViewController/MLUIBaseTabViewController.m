//
//  MLUIBaseTabViewController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUIBaseTabViewController.h"

@implementation MLUIBaseTabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.featureNavigationBarBGView addSubview:self.leftTitleView];
    [self.featureNavigationBarBGView addSubview:self.rightItemView];
    
    self.view.backgroundColor = [UIColor ml_defaultBGColor];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat left = 15.f;
    CGFloat centerY = ([self featureNavigationBarBGViewHeight] + [[UIApplication sharedApplication] statusBarFrame].size.height) * 0.5;
    [self.leftTitleView sizeToFit];
    self.leftTitleView.center = CGPointMake(left + self.leftTitleView.width * 0.5, centerY);
    [self.rightItemView sizeToFit];
    self.rightItemView.center = CGPointMake(self.featureNavigationBarBGView.width - left - self.rightItemView.width * 0.5, centerY);
}

- (CGFloat)featureNavigationBarBGViewHeight
{
    CGFloat height = [[UIApplication sharedApplication] statusBarFrame].size.height + 44.f + 10.f; // 比默认的导航栏高10pt
    return height;
}

- (UIView *)leftTitleView
{
    return [[UIView alloc] init];
}

- (UIView *)rightItemView
{
    return [[UIView alloc] init];
}

@end
