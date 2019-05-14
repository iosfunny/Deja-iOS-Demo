//
//  MLMeViewController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLMeViewController.h"
#import "MLMeHeaderView.h"
// cell controllers
#import "MLFollowingsCellController.h"
#import "MLFavouriteLooksCellController.h"
#import "MLFavouriteItemsCellController.h"
#import "MLWardrobeCellController.h"
#import "MLContactUsCellController.h"

const double headerViewHeight = 160.f;

@interface MLMeViewController ()

@property (nonatomic, strong) MLMeHeaderView * headerView;

@end

@implementation MLMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:resGetLocalizedString(@"Settings") style:UIBarButtonItemStyleDone target:self action:@selector(clickedSettings)];
    
    self.tableView.contentInset = UIEdgeInsetsMake(headerViewHeight, 0.f, 0.f, 0.f);
    [self.tableView addSubview:self.headerView];
}

- (BOOL)shouldAutoAddNavigationBarBGView
{
    return NO;
}

- (void)clickedSettings
{
    
}

- (MLMeHeaderView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[MLMeHeaderView alloc] init];
        _headerView.backgroundColor = [UIColor randomColor];
    }
    return _headerView;
}

- (void)featurePluginCells
{
    [super featurePluginCells];
    
    NSInteger section = 0;
    
    [self.cellProvider pluginCellController:[MLFollowingsCellController cellController] atSection:section];
    [self.cellProvider pluginCellController:[MLFavouriteLooksCellController cellController] atSection:section];
    [self.cellProvider pluginCellController:[MLFavouriteItemsCellController cellController] atSection:section];
    [self.cellProvider pluginCellController:[MLWardrobeCellController cellController] atSection:section];
    
    section ++;
    [self.cellProvider pluginCellController:[MLContactUsCellController cellController] atSection:section];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.headerView.frame = CGRectMake(0.f, - headerViewHeight, self.tableView.width, headerViewHeight);
}

@end
