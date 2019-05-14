//
//  MLFavouriteLooksCellController.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/14.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLFavouriteLooksCellController.h"
#import "MLMeBaseStaticTableViewCell.h"

@interface MLFavouriteLooksCellController ()

@property (nonatomic, strong) MLMeBaseStaticTableViewCell * favouriteLooksCell;

@end

@implementation MLFavouriteLooksCellController

- (UITableViewCell *)cell
{
    return self.favouriteLooksCell;
}

- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *)userInfo
{
    [super cellDidTriggerEvent:event userInfo:userInfo];
    
    
}

- (MLMeBaseStaticTableViewCell *)favouriteLooksCell
{
    if (!_favouriteLooksCell)
    {
        _favouriteLooksCell = [[MLMeBaseStaticTableViewCell alloc] init];
        _favouriteLooksCell.titleLabel.text = resGetLocalizedString(@"Favourite Looks");
    }
    return _favouriteLooksCell;
}

@end
