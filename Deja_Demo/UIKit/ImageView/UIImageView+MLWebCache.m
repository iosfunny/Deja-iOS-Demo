//
//  UIImageView+MLWebCache.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/7.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "UIImageView+MLWebCache.h"

#define ML_USE_SDWEBIMAGESDK 0

#if ML_USE_SDWEBIMAGESDK
#import <UIImageView+WebCache.h>
#endif

@implementation UIImageView (MLWebCache)

- (void)ml_setImageWithURL:(NSString *)urlString
{
    [self ml_setImageWithURL:urlString placeholderImage:nil progress:nil completed:nil];
}

- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage
{
    [self ml_setImageWithURL:urlString placeholderImage:placeholderImage progress:nil completed:nil];
}

- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage progress:(MLWebImageDownloadProgressBlock)progressBlock
{
    [self ml_setImageWithURL:urlString placeholderImage:placeholderImage progress:progressBlock completed:nil];
}

- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage completed:(MLExternalCompletionBlock)completedBlock
{
    [self ml_setImageWithURL:urlString placeholderImage:placeholderImage progress:nil completed:completedBlock];
}

- (void)ml_setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage progress:(MLWebImageDownloadProgressBlock)progressBlock completed:(MLExternalCompletionBlock)completedBlock
{
    /*
     核心实现. 如需要更换, 在此操作
     */
    
#if ML_USE_SDWEBIMAGESDK
    NSURL * URL = [NSURL URLWithString:urlString];
    assert(URL);
    [self sd_setImageWithURL:URL placeholderImage:placeholderImage options:SDWebImageLowPriority progress:progressBlock completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (completedBlock)
        {
            completedBlock(image, error, imageURL);
        }
    }];
#endif
}

@end
