//
//  UIColor+Base.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Base)

+ (UIColor *)ml_hexColor:(NSString *)hexColor;
+ (UIColor *)ml_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
+ (UIColor *)ml_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

+ (UIColor *)ml_tintColor;
+ (UIColor *)ml_defaultBGColor;

// For test ..
+ (UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END
