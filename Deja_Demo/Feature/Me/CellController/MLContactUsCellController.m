//
//  MLContactUsCellController.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/14.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLContactUsCellController.h"
#import "MLMeBaseStaticTableViewCell.h"

@interface MLContactUsCellController ()

@property (nonatomic, strong) MLMeBaseStaticTableViewCell * contactUsCell;

@end

@implementation MLContactUsCellController

- (UITableViewCell *)cell
{
    return self.contactUsCell;
}

- (void)cellDidTriggerEvent:(MLCellTriggerEvent)event userInfo:(NSDictionary *)userInfo
{
    [super cellDidTriggerEvent:event userInfo:userInfo];
    
    
}

- (MLMeBaseStaticTableViewCell *)contactUsCell
{
    if (!_contactUsCell)
    {
        _contactUsCell = [[MLMeBaseStaticTableViewCell alloc] init];
        _contactUsCell.titleLabel.text = resGetLocalizedString(@"Contact Us");
    }
    return _contactUsCell;
}

@end
