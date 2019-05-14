//
//  MLUIScrollView.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUIScrollView.h"
#import "MLLanguageHelper.h"

@implementation MLUIScrollView

- (BOOL)needHandler
{
    BOOL isOver = self.contentSize.width - self.width;
    return [[MLLanguageHelper helper] isRTL] && isOver;
}

- (void)setContentSize:(CGSize)contentSize
{
    [super setContentSize:contentSize];
    if ([self needHandler])
    {
        CGFloat contentInsetOffset = contentSize.width - self.width;
        self.contentInset = UIEdgeInsetsMake(0.f, contentInsetOffset, 0.f, -contentInsetOffset);
    }
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    [super touchesShouldCancelInContentView:view];
    
    return YES;
}

@end
