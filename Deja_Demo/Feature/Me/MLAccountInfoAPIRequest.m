//
//  MLAccountInfoAPIRequest.m
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/9.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLAccountInfoAPIRequest.h"

@interface MLAccountInfoAPIRequest () <MLAPIRequestModelAnalysisDelegate>

@end

@implementation MLAccountInfoAPIRequest

@synthesize responseModel = _responseModel;

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.analysisDelegate = self;
    }
    return self;
}

- (NSDictionary *)parameters
{
    return nil;
}

- (NSString *)apiAddress
{
    return @"";
}

- (MLAPIRequestMethod)requestMethod
{
    return MLAPIRequestMethodGET;
}

#pragma mark - AnalysisDelegate
- (void)APIRequest:(id<MLAPIRequestProtocol>)request analysisResponseObject:(NSDictionary *)responseObject
{
    self.responseModel = responseObject;
}

@end
