//
//  MLNetworkResponse.h
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MLNetworkResponseStatusCode)
{
    MLNetworkResponseStatusCodeUnknown = -1,
    MLNetworkResponseStatusCodeSuccess = 200,
    MLNetworkResponseStatusCodeBadRequest = 400,
};

NS_ASSUME_NONNULL_BEGIN

@interface MLNetworkResponse : NSObject

@property (nonatomic, assign) MLNetworkResponseStatusCode statusCode;
@property (nonatomic, strong, nullable) NSData * responseData;
@property (nonatomic, strong, nullable) NSDictionary * responseJson;
@property (nonatomic, strong, nullable) NSError * error;
@property (nonatomic, strong) NSString  * errorMsg;
@property (nonatomic, strong) NSURL * URL;

+ (nullable MLNetworkResponse *)responseWithDataTask:(NSURLSessionDataTask * _Nullable)dataTask responseObject:(id _Nullable)responseObject;
+ (nullable MLNetworkResponse *)responseWithDataTask:(NSURLSessionDataTask * _Nullable)dataTask error:(NSError *_Nullable)error;

@end

NS_ASSUME_NONNULL_END
