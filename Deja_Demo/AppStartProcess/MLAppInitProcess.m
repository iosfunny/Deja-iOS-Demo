//
//  MLAppInitProcess.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLAppInitProcess.h"
#import "MLAppRootController.h"
#import "MLAppRootControllerDelegate.h"
#import "MLUINavigationController.h"
#import "MLNavigator.h"
#import "MLResourceManager.h"

@interface MLAppInitProcess ()

@property (nonatomic, strong) MLAppRootControllerDelegate * appRootControllerDelegate;

@end

@implementation MLAppInitProcess

static MLAppInitProcess * instance = nil;
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self class] new];
    });
    return instance;
}

- (UIViewController *)makeRootViewControllerWithLaunchOptions:(NSDictionary *)launchOptions
{
    MLAppRootController * rootControlelr = [[MLAppRootController alloc] init];
    rootControlelr.delegate = self.appRootControllerDelegate;
    
    MLUINavigationController * rootNavigationController = [MLUINavigationController navigationControllerWithRootViewController:rootControlelr];
    rootNavigationController.delegate = self.appRootControllerDelegate;
    
    [MLNavigator sharedInstance].rootNavigationController = rootNavigationController;
    
    return rootNavigationController;
}

- (void)application:(UIApplication *)application beforeFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
     初始化本地资源
     */
    [[MLResourceManager sharedInstance] startInit];
    /*
     初始化网络库
     */
    
    /*
     初始化配置信息
     */
    
    /*
     初始化用户数据
     */
}

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
     本地验证
     */
    
    /*
     欢迎页面
     */
    
    [MLNextRunloopRunner run:^{
        // 为了不阻塞启动线程, 将功能性依赖放置在下一个runloop中初始化
        
        /*
         初始化路由
         */
        
        /*
         检测是否需要强制退出
         */
        
        /*
         建立长链接
         */
    }];
}

- (MLAppRootControllerDelegate *)appRootControllerDelegate
{
    if (!_appRootControllerDelegate)
    {
        _appRootControllerDelegate = [[MLAppRootControllerDelegate alloc] init];
    }
    return _appRootControllerDelegate;
}

@end
