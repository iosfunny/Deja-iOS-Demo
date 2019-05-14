//
//  MLBaseAPIRequest.m
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLBaseAPIRequest.h"
#import "MLNetworkRequestManager.h"

@interface MLBaseAPIRequest ()

@property (nonatomic, strong) NSURLSessionDataTask * dataTask;

@end

@implementation MLBaseAPIRequest

- (NSString *)apiAddress
{
    // subclazz hook ..
    return @"";
}

- (NSDictionary *)parameters
{
    return nil;
}

- (MLAPIRequestMethod)requestMethod
{
    // subclass hook ..
    return MLAPIRequestMethodGET;
}

- (NSString *)baseURLAddress
{
    /*
     根据环境参数, 设置不同的服务器域名.
     某个API如果需要设置不同域名, 实现该方法即可.
     */
    NSString * baseURL = @"";
    return baseURL;
}

- (NSString *)appendURLString
{
    NSString * baseURL = [self baseURLAddress];
    NSString * apiAddress = [self apiAddress];
    return [baseURL stringByAppendingPathComponent:apiAddress];
}

- (void)start
{
    MLAPIRequestMethod method = [self requestMethod];
    NSString * urlString = [self appendURLString];
    NSDictionary * parameters = [self parameters];
    if (method == MLAPIRequestMethodGET)
    {
        _dataTask = [[MLNetworkRequestManager manager] GET:urlString parameters:parameters progress:^(NSInteger receiveSize, NSInteger expectedSize, CGFloat progress) {
            if ([self.delegate respondsToSelector:@selector(APIRequest:progress:)])
            {
                [self.delegate APIRequest:self progress:progress];
            }
        } completed:^(MLNetworkResponse *response) {
            if (!response.error)
            {
                if ([self.analysisDelegate respondsToSelector:@selector(APIRequest:analysisResponseObject:)])
                {
                    [self.analysisDelegate APIRequest:self analysisResponseObject:response.responseJson];
                    
                    if ([self.delegate respondsToSelector:@selector(APIRequest:didSuccess:)])
                    {
                        [self.delegate APIRequest:self didSuccess:self.analysisDelegate.responseModel];
                    }
                }
            }
            else
            {
                if ([self.delegate respondsToSelector:@selector(APIRequest:didFailed:errorMsg:)])
                {
                    [self.delegate APIRequest:self didFailed:response.error errorMsg:response.errorMsg];
                }
            }
        }];
    }
    else if (method == MLAPIRequestMethodPOST)
    {
        _dataTask = [[MLNetworkRequestManager manager] POST:urlString parameters:parameters progress:^(NSInteger receiveSize, NSInteger expectedSize, CGFloat progress) {
            if ([self.delegate respondsToSelector:@selector(APIRequest:progress:)])
            {
                [self.delegate APIRequest:self progress:progress];
            }
        } completed:^(MLNetworkResponse *response) {
            if (!response.error)
            {
                if ([self.analysisDelegate respondsToSelector:@selector(APIRequest:analysisResponseObject:)])
                {
                    [self.analysisDelegate APIRequest:self analysisResponseObject:response.responseJson];
                    
                    if ([self.delegate respondsToSelector:@selector(APIRequest:didSuccess:)])
                    {
                        [self.delegate APIRequest:self didSuccess:self.analysisDelegate.responseModel];
                    }
                }
            }
            else
            {
                if ([self.delegate respondsToSelector:@selector(APIRequest:didFailed:errorMsg:)])
                {
                    [self.delegate APIRequest:self didFailed:response.error errorMsg:response.errorMsg];
                }
            }
        }];
    }
}

- (void)cancel
{
    [_dataTask cancel];
}

@end
