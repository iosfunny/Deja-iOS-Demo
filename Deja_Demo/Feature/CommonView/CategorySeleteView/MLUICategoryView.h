//
//  MLUICategoryView.h
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLUICategoryViewDelegate;

@interface MLUICategoryView : UIView

@property (nonatomic, weak) id <MLUICategoryViewDelegate> delegate;

- (void)reloadData;

@end

@protocol MLUICategoryViewDelegate <NSObject>

- (NSArray <NSString *> * _Nullable)categorysOfCategoryView:(MLUICategoryView *)categoryView;
- (void)categoryView:(MLUICategoryView *)categoryView didSelectedAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
