//
//  MLUIBaseStaticTableViewController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUIBaseStaticTableViewController.h"

@interface MLUIBaseStaticTableViewController ()

@end

@implementation MLUIBaseStaticTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self featurePluginCells];
}

- (void)featurePluginCells
{
    // subclass hook ..
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = [self featureNavigationBarBGViewHeight];
    self.tableView.frame = CGRectMake(0., top, self.view.width, self.view.height - top);
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0.f;
        if (@available(iOS 11.0, *))
        {
            [_tableView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0., 0.f, 0.f, 0.1)];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = view;
    }
    return _tableView;
}

- (MLTableCellProvider *)cellProvider
{
    if (!_cellProvider)
    {
        _cellProvider = [[MLTableCellProvider alloc] init];
    }
    return _cellProvider;
}

#pragma mark - TableViewDelegate | TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.cellProvider numberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellProvider numberOfRowAtSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 0.f;
    do
    {
        if (section == 0) { break; }
        height = 10.f;
    } while (false);
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <MLCellControllerProtocol> cellController = [self.cellProvider cellControllerAtIndexPath:indexPath];
    return [cellController cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <MLCellControllerProtocol> cellController = [self.cellProvider cellControllerAtIndexPath:indexPath];
    UITableViewCell * cell = [cellController cell];
    if (!cell)
    {
        assert(false);
        cell = [[UITableViewCell alloc] init];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    id <MLCellControllerProtocol> cellController = [self.cellProvider cellControllerAtIndexPath:indexPath];
    [cellController cellDidTriggerEvent:MLCellTriggerEventTouchUpInside userInfo:nil];
}

@end
