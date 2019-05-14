//
//  MLResourceManager.h
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLResourceManager : NSObject

+ (instancetype)sharedInstance;

- (NSString *)sandboxDirPath:(NSSearchPathDirectory)pathDirectory;
- (UIImage *)imageWithKeyPath:(NSString *)keyPath;
- (NSString *)resourcePath;
- (void)startInit;

UIImage * resGetImage(NSString * keyPath);
NSString * resGetLocalizedString(NSString * key);

@end

NS_ASSUME_NONNULL_END
