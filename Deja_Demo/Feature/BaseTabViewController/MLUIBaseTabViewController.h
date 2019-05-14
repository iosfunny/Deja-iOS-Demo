//
//  MLUIBaseTabViewController.h
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUILightViewController.h"

NS_ASSUME_NONNULL_BEGIN

/*
 一级页面都继承这个类.
 */
@interface MLUIBaseTabViewController : MLUILightViewController

// sub class hook ..
@property (nonatomic, strong) UIView * leftTitleView;
@property (nonatomic, strong) UIView * rightItemView;

@end

NS_ASSUME_NONNULL_END
