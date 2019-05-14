//
//  UIImageView+MLWebCache.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MLWebImageDownloadProgressBlock)(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL);
typedef void(^MLExternalCompletionBlock)(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL);

@interface UIImageView (MLWebCache)

- (void)ml_setImageWithURL:(NSString *)urlString;
- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *_Nullable)placeholderImage;
- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *_Nullable)placeholderImage progress:(MLWebImageDownloadProgressBlock _Nullable)progressBlock;
- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *_Nullable)placeholderImage completed:(MLExternalCompletionBlock _Nullable)completedBlock;
- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *_Nullable)placeholderImage progress:(MLWebImageDownloadProgressBlock _Nullable)progressBlock completed:(MLExternalCompletionBlock _Nullable)completedBlock;

@end

NS_ASSUME_NONNULL_END
