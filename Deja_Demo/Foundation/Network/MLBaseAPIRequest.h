//
//  MLBaseAPIRequest.h
//  ProjectBaseService
//
//  Created by XiaoZefeng on 2019/4/8.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLAPIRequestProtocol.h"

@protocol MLBaseAPIRequestDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface MLBaseAPIRequest : NSObject <MLAPIRequestProtocol>

@property (nonatomic, weak) id <MLBaseAPIRequestDelegate> delegate;
@property (nonatomic, weak) id <MLAPIRequestModelAnalysisDelegate> analysisDelegate;

@end

@protocol MLBaseAPIRequestDelegate <NSObject>

@optional

- (void)APIRequest:(MLBaseAPIRequest *)request progress:(CGFloat)progress;
- (void)APIRequest:(MLBaseAPIRequest *)request didSuccess:(id _Nullable)result;
- (void)APIRequest:(MLBaseAPIRequest *)request didFailed:(NSError *)error errorMsg:(NSString * _Nullable)msg;

@end

NS_ASSUME_NONNULL_END
