//
//  MLTableCellProvider.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLTableCellProvider.h"

@interface MLTableCellProvider ()

@property (nonatomic, strong) NSMutableArray <NSMutableArray <id<MLCellControllerProtocol>> *> * sections;

@end

@implementation MLTableCellProvider

- (void)pluginCellController:(id<MLCellControllerProtocol>)cellController atSection:(NSInteger)section
{
    NSInteger sectionCount = self.sections.count;
    NSMutableArray <id<MLCellControllerProtocol>> * cellControllers = nil;
    if (sectionCount > section)
    {
        cellControllers = [self.sections objectAtIndex:section];
    }
    else
    {
        cellControllers = [NSMutableArray array];
        [self.sections addObject:cellControllers];
    }
    
    if (![cellControllers containsObject:cellController])
    {
        [cellControllers addObject:cellController];
    }
}

- (void)unpluginCellController:(id<MLCellControllerProtocol>)cellController atSection:(NSInteger)section
{
    NSInteger sectionCount = self.sections.count;
    NSMutableArray <id<MLCellControllerProtocol>> * cellControllers = nil;
    if (sectionCount > section)
    {
        cellControllers = [self.sections objectAtIndex:section];
    }
    
    if ([cellControllers containsObject:cellController])
    {
        [cellControllers removeObject:cellController];
    }
}

- (void)removeAllCellControllers
{
    [self.sections removeAllObjects];
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSection
{
    return self.sections.count;
}

- (NSInteger)numberOfRowAtSection:(NSInteger)section
{
    NSMutableArray <id<MLCellControllerProtocol>> * cellControllers = [self.sections objectAtIndex:section];
    return cellControllers.count;
}

- (id<MLCellControllerProtocol>)cellControllerAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSMutableArray <id<MLCellControllerProtocol>> * cellControllers = nil;
    id <MLCellControllerProtocol> cellController = nil;
    if (self.sections.count > section)
    {
        cellControllers = [self.sections objectAtIndex:section];
    }
    if (cellControllers.count > row)
    {
        cellController = [cellControllers objectAtIndex:row];
    }
    
    assert(cellController);
    return cellController;
}

#pragma mark - Getter
- (NSMutableArray<NSMutableArray<id<MLCellControllerProtocol>> *> *)sections
{
    if (!_sections)
    {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

@end
