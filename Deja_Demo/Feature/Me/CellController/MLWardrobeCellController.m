//
//  MLWardrobeCellController.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/14.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLWardrobeCellController.h"
#import "MLMeBaseStaticTableViewCell.h"

@interface MLWardrobeCellController ()

@property (nonatomic, strong) MLMeBaseStaticTableViewCell * wardrobeCell;

@end

@implementation MLWardrobeCellController

- (UITableViewCell *)cell
{
    return self.wardrobeCell;
}

- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *)userInfo
{
    [super cellDidTriggerEvent:event userInfo:userInfo];
    
    
}

- (MLMeBaseStaticTableViewCell *)wardrobeCell
{
    if (!_wardrobeCell)
    {
        _wardrobeCell = [[MLMeBaseStaticTableViewCell alloc] init];
        _wardrobeCell.titleLabel.text = resGetLocalizedString(@"Wardrobe");
    }
    return _wardrobeCell;
}

@end
