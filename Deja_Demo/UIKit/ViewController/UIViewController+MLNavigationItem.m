//
//  UIViewController+MLNavigationItem.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "UIViewController+MLNavigationItem.h"
#import <objc/runtime.h>
#import "NSObject+MLRuntime.h"

@implementation MLControllerTitleView

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    self.titleLabel.textColor = tintColor;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.titleLabel];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)click
{
    if ([self.delegate respondsToSelector:@selector(controllerTitleViewDidClick:)])
    {
        [self.delegate controllerTitleViewDidClick:self];
    }
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        UIFont * titleFont = [UIFont boldSystemFontOfSize:18.f];
        _titleLabel.font = titleFont;
        UIColor * titleColor = [UIColor blackColor];
        _titleLabel.textColor = titleColor;
    }
    return _titleLabel;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize titleSize = [self.titleLabel sizeThatFits:size];
    
    CGSize contentSize = titleSize;
    
    contentSize.height = self.height;
    
    return contentSize;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.width = MIN(self.titleLabel.width, [UIScreen mainScreen].bounds.size.width - 100.f);
    self.titleLabel.centerY = CGRectGetMidY(self.bounds);
}

@end

const char * kCustomTitleView = NULL;
@interface UIViewController () <MLControllerTitleViewDelegate>

@end

@implementation UIViewController (MLNavigationItem)

+ (void)load
{
    [NSObject swizzWithClass:self originSel:@selector(viewWillAppear:) newSel:@selector(MLNavigationItem_hook_viewWillAppear:)];
    
    [NSObject swizzWithClass:self originSel:@selector(setTitle:) newSel:@selector(MLNavigationItem_hook_setTitle:)];
}

- (UIColor *)navigationBarTintColor
{
    return [UIColor whiteColor];
}

- (void)MLNavigationItem_hook_setTitle:(NSString *)title
{
    [self MLNavigationItem_hook_setTitle:title];
    
    MLControllerTitleView * customTitleView = objc_getAssociatedObject(self, &kCustomTitleView);
    customTitleView.titleLabel.text = title;
    [customTitleView sizeToFit];
}

- (MLControllerTitleView *)customTitleView
{
    MLControllerTitleView * customTitleView = objc_getAssociatedObject(self, &kCustomTitleView);
    if (!customTitleView)
    {
        customTitleView = [[MLControllerTitleView alloc] init];
        customTitleView.delegate = self;
        CGFloat navigationBarHeight = self.navigationController.navigationBar.height;
        customTitleView.height = navigationBarHeight;
        customTitleView.titleLabel.text = self.title;
        objc_setAssociatedObject(self, &kCustomTitleView, customTitleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return customTitleView;
}

- (void)setCustomTitleView:(MLControllerTitleView *)customTitleView
{
    MLControllerTitleView * _customTitleView = objc_getAssociatedObject(self, &kCustomTitleView);
    if (_customTitleView != customTitleView)
    {
        _customTitleView = customTitleView;
        objc_setAssociatedObject(self, &kCustomTitleView, _customTitleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)MLNavigationItem_hook_viewWillAppear:(BOOL)animated
{
    [self MLNavigationItem_hook_viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [self navigationBarTintColor];
}

- (void)controllerTitleViewDidClick:(MLControllerTitleView *)controllerTitleView
{
    [self viewDidClickTitleView:controllerTitleView];
}

- (void)viewDidClickTitleView:(MLControllerTitleView *)controllerTitleView
{
    // subclass hook ..
}

@end



