//
//  MLCellControllerProtocol.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, MLCellTriggerEvent)
{
    MLCellTriggerEventTouchUpInside
};

NS_ASSUME_NONNULL_BEGIN

@protocol MLCellControllerProtocol <NSObject>

@required
- (UITableViewCell *)cell;
- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *_Nullable)userInfo;
- (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
