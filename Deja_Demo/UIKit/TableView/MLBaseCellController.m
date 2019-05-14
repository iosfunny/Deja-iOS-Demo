//
//  MLBaseCellController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLBaseCellController.h"



@implementation MLBaseCellController

+ (instancetype)cellController
{
    MLBaseCellController * cellController = [[[self class] alloc] init];
    return cellController;
}

- (UITableViewCell *)cell
{
    // subclass hook ..
    return [[UITableViewCell alloc] init];
}

- (CGFloat)cellHeight
{
    return 60.f;
}

- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *)userInfo
{
    NSLog(@"%s", __func__);
}

- (void)callDelegateToReloadTableView
{
    if ([self.delegate respondsToSelector:@selector(cellControllerDidLayoutToNeedReloadTableView:)])
    {
        [self.delegate cellControllerDidLayoutToNeedReloadTableView:self];
    }
}

@end
