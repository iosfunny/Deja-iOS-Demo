//
//  MLUIBaseStaticTableViewController.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUILightViewController.h"
#import "MLTableCellProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLUIBaseStaticTableViewController : MLUILightViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) MLTableCellProvider * cellProvider;
- (void)featurePluginCells;

@end

NS_ASSUME_NONNULL_END
