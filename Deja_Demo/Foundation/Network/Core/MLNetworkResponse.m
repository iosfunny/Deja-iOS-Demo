//
//  MLNetworkResponse.m
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLNetworkResponse.h"

@implementation MLNetworkResponse

- (instancetype)initWithDataTask:(NSURLSessionDataTask *_Nullable)dataTask
{
    self = [super init];
    if (self)
    {
        _URL = dataTask.response.URL;
    }
    return self;
}

+ (MLNetworkResponse *)responseWithDataTask:(NSURLSessionDataTask *)dataTask responseObject:(id)responseObject
{
    MLNetworkResponse * response = [[MLNetworkResponse alloc] initWithDataTask:dataTask];
    
    if ([responseObject isKindOfClass:[NSDictionary class]])
    {
        NSDictionary * json = (NSDictionary *)responseObject;
        response.responseJson = json;
        NSError * error;
        NSData * responseData = [NSJSONSerialization dataWithJSONObject:json options:0 error:&error];
        response.responseData = responseData;
        response.error = error;
        NSInteger statusCode;
        if (!error)
        {
            statusCode = [json mlsafe_integerValueForKey:@"status"];
            response.errorMsg = [json mlsafe_stringValueForKey:@"msg"];
        }
        else
        {
            statusCode = error.code;
            response.errorMsg = [error description];
        }
        response.statusCode = statusCode;
    }
    
    return response;
}

+ (MLNetworkResponse *)responseWithDataTask:(NSURLSessionDataTask *)dataTask error:(NSError *)error
{
    MLNetworkResponse * response = [[MLNetworkResponse alloc] initWithDataTask:dataTask];
    response.error = error;
    response.statusCode = error.code;
    response.errorMsg = [error description];
    
    return response;
}

@end
