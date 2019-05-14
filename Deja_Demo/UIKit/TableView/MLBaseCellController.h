//
//  MLBaseCellController.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLCellControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MLBaseCellControllerDelegate;

@interface MLBaseCellController : NSObject <MLCellControllerProtocol>

@property (nonatomic, weak) id <MLBaseCellControllerDelegate> delegate;

+ (instancetype)cellController;

- (void)callDelegateToReloadTableView;

@end

@protocol MLBaseCellControllerDelegate <NSObject>

- (void)cellControllerDidLayoutToNeedReloadTableView:(MLBaseCellController *)cellController;

@end

NS_ASSUME_NONNULL_END
