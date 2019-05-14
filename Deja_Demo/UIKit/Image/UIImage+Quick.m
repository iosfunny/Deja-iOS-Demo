//
//  UIImage+Quick.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "UIImage+Quick.h"

@implementation UIImage (Quick)

+ (UIImage *)sharedEmptyImage
{
    return [[UIImage alloc] init];
}

+ (UIImage *)colorImageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(CGSizeMake(1.f, 1.f));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)colorRoundImageWithColor:(UIColor *)color size:(CGFloat)size
{
    CGFloat relSize = [UIScreen mainScreen].scale * size;
    UIGraphicsBeginImageContext(CGSizeMake(relSize, relSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, relSize / 2, relSize / 2, relSize / 2, 0, M_PI * 2, 1);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
