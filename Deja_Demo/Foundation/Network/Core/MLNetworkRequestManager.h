//
//  MLNetworkRequestManager.h
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLNetworkResponse.h"

typedef void(^MLNetworkProgress)(NSInteger receiveSize, NSInteger expectedSize, CGFloat progress);
typedef void(^MLNetworkCompleted)(MLNetworkResponse * response);

NS_ASSUME_NONNULL_BEGIN

@interface MLNetworkRequestManager : NSObject

+ (instancetype)manager;

- (nullable NSURLSessionDataTask *)GET:(NSString *)urlString
                            parameters:(nullable NSDictionary *)parameters
                              progress:(nullable MLNetworkProgress)progressBlock
                             completed:(nullable MLNetworkCompleted)completedBlock;

- (nullable NSURLSessionDataTask *)POST:(NSString *)urlString
                            parameters:(nullable NSDictionary *)parameters
                              progress:(nullable MLNetworkProgress)progressBlock
                             completed:(nullable MLNetworkCompleted)completedBlock;

- (void)cancelAllTasks;

@end

NS_ASSUME_NONNULL_END
