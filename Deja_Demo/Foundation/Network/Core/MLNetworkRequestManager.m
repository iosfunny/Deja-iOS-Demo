//
//  MLNetworkRequestManager.m
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLNetworkRequestManager.h"
#import "MLHTTPSesseionManager.h"

@interface MLNetworkRequestManager ()

@property (nonatomic, strong) NSMutableArray <NSURLSessionDataTask *> * tasks;

@end

@implementation MLNetworkRequestManager

+ (instancetype)manager
{
    static MLNetworkRequestManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self class] new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        // 初始化session manager, 配置config
    }
    return self;
}

- (NSMutableArray<NSURLSessionDataTask *> *)tasks
{
    if (!_tasks)
    {
        _tasks = [NSMutableArray array];
    }
    return _tasks;
}

- (NSURLSessionDataTask *)GET:(NSString *)urlString parameters:(NSDictionary *)parameters progress:(MLNetworkProgress)progressBlock completed:(MLNetworkCompleted)completedBlock
{
    NSURLSessionDataTask * task = [[MLHTTPSesseionManager manager] GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progressBlock)
        {
            NSInteger receiveSize = downloadProgress.completedUnitCount;
            NSInteger expectedSize =  downloadProgress.totalUnitCount;
            CGFloat progress = (CGFloat)receiveSize / expectedSize;
            progressBlock(receiveSize, expectedSize, progress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MLNetworkResponse * response = [MLNetworkResponse responseWithDataTask:task responseObject:responseObject];
        if (completedBlock)
        {
            completedBlock(response);
        }
        
        if ([self.tasks containsObject:task]) { [self.tasks removeObject:task]; }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MLNetworkResponse * response = [MLNetworkResponse responseWithDataTask:task error:error];
        if (completedBlock)
        {
            completedBlock(response);
        }
        
        if ([self.tasks containsObject:task]) { [self.tasks removeObject:task]; }
    }];
    if (task)
    {
        [self.tasks addObject:task];
    }
    return task;
}

- (NSURLSessionDataTask *)POST:(NSString *)urlString parameters:(NSDictionary *)parameters progress:(MLNetworkProgress)progressBlock completed:(MLNetworkCompleted)completedBlock
{
    NSURLSessionDataTask * task = [[MLHTTPSesseionManager manager] POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressBlock)
        {
            NSInteger receiveSize = uploadProgress.completedUnitCount;
            NSInteger expectedSize =  uploadProgress.totalUnitCount;
            CGFloat progress = (CGFloat)receiveSize / expectedSize;
            progressBlock(receiveSize, expectedSize, progress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MLNetworkResponse * response = [MLNetworkResponse responseWithDataTask:task responseObject:responseObject];
        if (completedBlock)
        {
            completedBlock(response);
        }
        
        if ([self.tasks containsObject:task]) { [self.tasks removeObject:task]; }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        MLNetworkResponse * response = [MLNetworkResponse responseWithDataTask:task error:error];
        if (completedBlock)
        {
            completedBlock(response);
        }
        
        if ([self.tasks containsObject:task]) { [self.tasks removeObject:task]; }
    }];
    if (task)
    {
        [self.tasks addObject:task];
    }
    return task;
}

- (void)cancelAllTasks
{
    [self.tasks makeObjectsPerformSelector:@selector(cancel)];
    [self.tasks removeAllObjects];
}

@end
