//
//  MLTableCellProvider.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLCellControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLTableCellProvider : NSObject

- (void)pluginCellController:(id<MLCellControllerProtocol>)cellController atSection:(NSInteger)section;
- (void)unpluginCellController:(id<MLCellControllerProtocol>)cellController atSection:(NSInteger)section;
- (void)removeAllCellControllers;

- (id<MLCellControllerProtocol>)cellControllerAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfSection;
- (NSInteger)numberOfRowAtSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
