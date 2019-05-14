//
//  MLFollowingsCellController.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/14.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLFollowingsCellController.h"
#import "MLMeBaseStaticTableViewCell.h"

@interface MLFollowingsCellController ()

@property (nonatomic, strong) MLMeBaseStaticTableViewCell * followingsCell;

@end

@implementation MLFollowingsCellController

- (UITableViewCell *)cell
{
    return self.followingsCell;
}

- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *)userInfo
{
    [super cellDidTriggerEvent:event userInfo:userInfo];
    
    
}

- (MLMeBaseStaticTableViewCell *)followingsCell
{
    if (!_followingsCell)
    {
        _followingsCell = [[MLMeBaseStaticTableViewCell alloc] init];
        _followingsCell.titleLabel.text = resGetLocalizedString(@"Followings");
    }
    return _followingsCell;
}

@end
