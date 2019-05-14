//
//  UIColor+Base.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "UIColor+Base.h"

@implementation UIColor (Base)

+ (UIColor *)ml_hexColor:(NSString *)hexColor
{
    unsigned int red, green, blue, alpha;
    NSRange range;
    range.length = 2;
    @try {
        if ([hexColor hasPrefix:@"#"])
        {
            hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
        }
        range.location = 0;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
        range.location = 2;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
        range.location = 4;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
        
        if ([hexColor length] > 6) {
            range.location = 6;
            [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&alpha];
        }
    }
    @catch (NSException * e) {
        //        [MAUIToolkit showMessage:[NSString stringWithFormat:@"颜色取值错误:%@,%@", [e name], [e reason]]];
        //        return [UIColor blackColor];
    }
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:(float)(1.0f)];
}

+ (UIColor *)ml_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue
{
    return [self ml_colorWithRed:red green:green blue:blue alpha:1.f];
}

+ (UIColor *)ml_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.f green:green / 255.f blue:blue / 255.f alpha:alpha];
}

+ (UIColor *)ml_tintColor
{
    return [self ml_hexColor:@"#03AD8F"];
}

+ (UIColor *)ml_defaultBGColor
{
    return [self ml_hexColor:@"#FFFFFF"];
}

+ (UIColor *)randomColor
{
    return [self ml_colorWithRed:arc4random() % 255 green:arc4random() % 255 blue:arc4random() % 255];
}

@end
