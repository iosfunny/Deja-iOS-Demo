//
//  MLUICategoryItemView.h
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLUICategoryItemView : UIView

@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) BOOL seleted;
- (void)addTarget:(id _Nullable)target action:(SEL)sel;

@end

NS_ASSUME_NONNULL_END
