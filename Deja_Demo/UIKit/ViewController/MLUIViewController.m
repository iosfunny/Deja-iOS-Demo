//
//  MLUIViewController.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/4.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUIViewController.h"
#import "UIImage+Quick.h"

@interface MLUIViewController ()

@property (nonatomic, strong) MLImageView * navigationBarBackgroundView;
@property (nonatomic, assign) BOOL featureNavigationBarBGViewLayouted;
@property (nonatomic, assign) BOOL didAutoAddNavigationBarBGViewHandled;
@property (nonatomic, assign) BOOL viewDidLoadHandled;
@property (nonatomic, assign) BOOL isMutableTitleBoardPulled;

@end

@implementation MLUIViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

/*
 1. 子类的viewDidLoad先执行
 2. add featureNavigationBarBGView
 3. customViewDidLoad
 */

- (void)customViewDidLoad
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:resGetLocalizedString(@"Back") style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.view setBackgroundColor:[UIColor ml_defaultBGColor]];
    
    [MLNextRunloopRunner run:^{
        if ([self shouldAutoAddNavigationBarBGView])
        {
            [self.view addSubview:self.featureNavigationBarBGView];
        }
        [self customViewDidLoad];
    }];
}

- (BOOL)shouldAutoAddNavigationBarBGView
{
    return YES;
}

- (UIView *)featureNavigationBarBGView
{
    return self.navigationBarBackgroundView;
}

- (CGFloat)featureNavigationBarBGViewHeight
{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    return statusBarFrame.size.height + 49.f;
}

- (MLImageView *)navigationBarBackgroundView
{
    if (!_navigationBarBackgroundView)
    {
        _navigationBarBackgroundView = [[MLImageView alloc] init];
        UIImage * image = [UIImage colorImageWithColor:[UIColor ml_hexColor:@"#2C2C2C"]];
        _navigationBarBackgroundView.image = image;
    }
    return _navigationBarBackgroundView;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (!_featureNavigationBarBGViewLayouted)
    {
        _featureNavigationBarBGViewLayouted = YES;
        self.featureNavigationBarBGView.frame = CGRectMake(- 0.5, 0.f, self.view.width + 1.f, [self featureNavigationBarBGViewHeight]);
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
