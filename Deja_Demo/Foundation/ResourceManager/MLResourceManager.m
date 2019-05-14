//
//  MLResourceManager.m
//  ProjectBaseService
//
//  Created by mozat on 2019/4/5.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLResourceManager.h"
#import "UIImage+Quick.h"

@interface MLResourceManager ()

@property (nonatomic, strong) NSCache <NSString *, UIImage *> * localImageCache; // 图片资源缓存
@property (nonatomic, copy) NSString * resourcePath;                             // 资源根目录
@property (nonatomic, copy) NSString * imagesMainPath;                           // 图片资源根目录
@property (nonatomic, copy) NSString * imageLastPathComponent;                   // 图片资源优先搜索叶子文件夹 @2x @3x
@property (nonatomic, copy) NSString * imageDefaultPathComponet;                 // 图片资源默认搜索叶子文件 @2x
@property (nonatomic, strong) NSBundle * languageBundle;

@end

@implementation MLResourceManager

+ (instancetype)sharedInstance
{
    static MLResourceManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self class] new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _imagesMainPath = [self staticImageResourcePath];
        _imageLastPathComponent = [UIScreen mainScreen].scale > 2.0 ? @"@3x" : @"@2x";
        _imageDefaultPathComponet = @"@2x";
    }
    return self;
}

- (void)startInit
{
    [self languageBundle];
}

#pragma mark - Public
- (UIImage *)imageWithKeyPath:(NSString *)keyPath
{
    return [self imageWithKeyPath:keyPath systemCache:YES];
}

- (UIImage *)imageWithKeyPath:(NSString *)keyPath systemCache:(BOOL)systemCache
{
    UIImage * image = nil;
    do
    {
        image = [self.localImageCache objectForKey:keyPath]; if (image) break;
        
        NSString * string = [self.imagesMainPath stringByAppendingPathComponent:keyPath]; // 全路径
        NSString * dirPath = [string stringByDeletingLastPathComponent]; // 上级目录
        NSString * imageDirPath = [dirPath stringByAppendingPathComponent:_imageLastPathComponent]; // 插入@2x或者@3x目录
        NSString * filePath = [imageDirPath stringByAppendingPathComponent:[string lastPathComponent]]; // 最后索引的全路径
        image = [[UIImage alloc] initWithContentsOfFile:filePath]; // 加载图片
        if (image) { [self.localImageCache setObject:image forKey:keyPath]; break; }
        
        imageDirPath = [dirPath stringByAppendingPathComponent:_imageDefaultPathComponet]; // 默认插入@2x目录
        filePath = [imageDirPath stringByAppendingPathComponent:[string lastPathComponent]]; // 最后索引的全路径
        image = [[UIImage alloc] initWithContentsOfFile:filePath]; // 加载图片
        if (image) { [self.localImageCache setObject:image forKey:keyPath]; break; }
        
        // 找不到静态资源图片.
        image = [UIImage colorImageWithColor:[UIColor whiteColor]];
    } while (false);
    
    return image;
}

- (NSString *)sandboxDirPath:(NSSearchPathDirectory)pathDirectory
{
    NSArray <NSString *> * pathes = NSSearchPathForDirectoriesInDomains(pathDirectory, NSUserDomainMask, YES);
    return [pathes firstObject];
}

#pragma mark - C Function
UIImage * resGetImage(NSString * keyPath)
{
    return [[MLResourceManager sharedInstance] imageWithKeyPath:keyPath];
}

NSString * resGetLocalizedString(NSString * key)
{
    NSBundle * languageBundle = [[MLResourceManager sharedInstance] languageBundle];
    NSString * baseString = [languageBundle localizedStringForKey:key value:@"" table:nil];
    if (!baseString)
    {
        baseString = NSLocalizedString(key, nil);
    }
    return baseString;
}

#pragma mark - Getter
- (NSCache<NSString *,UIImage *> *)localImageCache
{
    if (!_localImageCache)
    {
        _localImageCache = [[NSCache alloc] init];
        _localImageCache.totalCostLimit = 100;
        _localImageCache.countLimit = 100;
    }
    return _localImageCache;
}

- (NSString *)resourcePath
{
    if (!_resourcePath)
    {
        NSString * bundlePath = [[NSBundle mainBundle] bundlePath];
        NSString * resourcePath = [bundlePath stringByAppendingPathComponent:@"ml_resources"];
        _resourcePath = [resourcePath copy];
    }
    return _resourcePath;
}

- (NSString *)staticImageResourcePath
{
    NSString * path = [self.resourcePath stringByAppendingPathComponent:@"images"];
    return path;
}

- (NSBundle *)languageBundle
{
//    if (!_languageBundle)
//    {
//        NSString * resource = nil;
//        NSString * lang = nil;
//        NSString * preferredLanguages = [[NSLocale preferredLanguages] firstObject];
//
//        resource = @"en";
//        lang = @"en";
//
//        if ([preferredLanguages hasPrefix:@"zh-"])
//        {
//            resource = @"zh-Hans";
//            lang = @"zh-chs";
//        }
//
//#if ONLY_CHINESE
//        resource = @"zh-Hans";
//        lang = @"zh-chs";
//#endif
//
//        NSString * path = [[NSBundle mainBundle] pathForResource:resource ofType:@"lproj"];
//        assert(path);
//        if (path)
//        {
//            _languageBundle = [NSBundle bundleWithPath:path];
//        }
//    }
    
    return _languageBundle;
}

@end
