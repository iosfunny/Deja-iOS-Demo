//
//  UIFont+Base.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "UIFont+Base.h"

@implementation UIFont (Base)

+ (UIFont *)ml_fontWithSize:(CGFloat)size
{
    UIFont * font = [UIFont systemFontOfSize:size];
    return font;
}

+ (UIFont *)ml_boldFontWithSize:(CGFloat)size
{
    UIFont * font = [UIFont boldSystemFontOfSize:size];
    return font;
}

@end
