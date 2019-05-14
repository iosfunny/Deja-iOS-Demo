//
//  MLTransparentNavigationBar.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLTransparentNavigationBar.h"
#import "UIImage+Quick.h"

@implementation MLTransparentNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImage * image = [UIImage sharedEmptyImage];
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:image];
        
        [self setTintColor:UIColor.whiteColor];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView * view = [super hitTest:point withEvent:event];
    
    Class clazz = NSClassFromString(@"_UINavigationBarContentView");
    if (view == self || [view isKindOfClass:clazz])
    {
        return nil;
    }
    
    return view;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSArray <UIView *> * subviews = [self subviews];
    for (UIView * subview in subviews)
    {
        subview.backgroundColor = UIColor.clearColor;
    }
}

@end
