//
//  MLFavouriteItemsCellController.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/14.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLFavouriteItemsCellController.h"
#import "MLMeBaseStaticTableViewCell.h"

@interface MLFavouriteItemsCellController ()

@property (nonatomic, strong) MLMeBaseStaticTableViewCell * favouriteItemsCell;

@end

@implementation MLFavouriteItemsCellController

- (UITableViewCell *)cell
{
    return self.favouriteItemsCell;
}

- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *)userInfo
{
    [super cellDidTriggerEvent:event userInfo:userInfo];
    
    
}

- (MLMeBaseStaticTableViewCell *)favouriteItemsCell
{
    if (!_favouriteItemsCell)
    {
        _favouriteItemsCell = [[MLMeBaseStaticTableViewCell alloc] init];
        _favouriteItemsCell.titleLabel.text = resGetLocalizedString(@"Favourite Items");
    }
    return _favouriteItemsCell;
}

@end
