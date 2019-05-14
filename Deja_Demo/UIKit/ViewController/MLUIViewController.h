//
//  MLUIViewController.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLUIViewController : UIViewController

- (void)customViewDidLoad;

#pragma mark - NavigationBar Custom
- (BOOL)shouldAutoAddNavigationBarBGView;
- (CGFloat)featureNavigationBarBGViewHeight;
- (UIView *)featureNavigationBarBGView;

@end

NS_ASSUME_NONNULL_END
