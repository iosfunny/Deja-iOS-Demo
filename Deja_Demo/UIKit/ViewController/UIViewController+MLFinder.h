//
//  UIViewController+MLFinder.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MLFinder)

- (UIViewController *)ml_findCustomTopViewController;
- (void)updateNavigationItem:(UINavigationItem *)navigationItem;

@end

NS_ASSUME_NONNULL_END
