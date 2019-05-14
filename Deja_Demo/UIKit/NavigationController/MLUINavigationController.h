//
//  MLUINavigationController.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLUINavigationController : UINavigationController

+ (MLUINavigationController *)navigationControllerWithRootViewController:(UIViewController *)rootViewController;

@end

@interface UIViewController (MLUINavigationController)

- (BOOL)navigationShouldPopOnBackButton;

@end

NS_ASSUME_NONNULL_END
