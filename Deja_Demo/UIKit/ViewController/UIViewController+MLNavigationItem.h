//
//  UIViewController+MLNavigationItem.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLControllerTitleViewDelegate;

@interface MLControllerTitleView : UIView

@property (nonatomic, weak) id <MLControllerTitleViewDelegate> delegate;
@property (nonatomic, strong) UILabel * titleLabel;

@end

@interface UIViewController (MLNavigationItem)

@property (nonatomic, strong) MLControllerTitleView * customTitleView;

- (UIColor *)navigationBarTintColor;
- (void)viewDidClickTitleView:(MLControllerTitleView *)controllerTitleView;

@end

@protocol MLControllerTitleViewDelegate <NSObject>

@optional
- (void)controllerTitleViewDidClick:(MLControllerTitleView *)controllerTitleView;

@end

NS_ASSUME_NONNULL_END
