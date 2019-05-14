//
//  MLAPIRequestProtocol.h
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MLAPIRequestMethod)
{
    MLAPIRequestMethodGET,
    MLAPIRequestMethodPOST,
};

NS_ASSUME_NONNULL_BEGIN

@protocol MLAPIRequestModelAnalysisDelegate;

@protocol MLAPIRequestProtocol <NSObject>

@required
- (NSString *)apiAddress;

- (nullable NSDictionary *)parameters;

- (MLAPIRequestMethod)requestMethod;

@optional
@property (nonatomic, weak) id <MLAPIRequestModelAnalysisDelegate> analysisDelegate;

- (NSString *)baseURLAddress;

/*
 需要持有request、response吗?
 */

- (void)start;
- (void)cancel;

@end

/*
 解析不同request对应的model.
 */
@protocol MLAPIRequestModelAnalysisDelegate <NSObject>

@property (nonatomic, strong, nullable) id responseModel;
// 解析完把结果赋值给responseModel
- (void)APIRequest:(id<MLAPIRequestProtocol>)request analysisResponseObject:(NSDictionary *_Nullable)responseObject;

@end

NS_ASSUME_NONNULL_END
