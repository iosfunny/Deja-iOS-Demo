//
//  MLUINavigationBar.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUINavigationBar.h"

@implementation MLUINavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIColor * color = [UIColor whiteColor];
        UIFont * titleFont = [UIFont systemFontOfSize:18.f];
        NSDictionary * dict = @{ NSFontAttributeName : titleFont, NSForegroundColorAttributeName : color };
        self.titleTextAttributes = dict;
        
        self.backIndicatorImage = resGetImage(@"Common/back.png");
        self.backIndicatorTransitionMaskImage = resGetImage(@"Common/back.png");
    }
    return self;
}

@end
