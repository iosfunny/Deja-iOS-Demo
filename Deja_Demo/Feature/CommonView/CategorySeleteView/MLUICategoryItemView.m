//
//  MLUICategoryItemView.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUICategoryItemView.h"

@interface MLUICategoryItemView ()

@property (nonatomic, strong) UIImageView * bgImageView;
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIImage * normalImage;
@property (nonatomic, strong) UIImage * selectedImage;

@end

@implementation MLUICategoryItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.bgImageView];
        [self addSubview:self.button];
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)sel
{
    [self.button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitle:(NSString *)title
{
    if (![_title isEqualToString:title])
    {
        _title = [title copy];
        
        [self.button setTitle:title forState:UIControlStateNormal];
        
        self.bgImageView.image = [self fetchBackgroundImageWithSize:[self sizeThatFits:CGSizeZero]];
    }
}

- (CGSize)sizeThatFits:(CGSize)size
{
    [self.button.titleLabel sizeToFit];
    CGFloat width = self.button.titleLabel.width + 20.f;
    
    return CGSizeMake(width, 38.f);
}

- (void)setSeleted:(BOOL)seleted
{
    if (_seleted != seleted)
    {
        _seleted = seleted;
        self.button.selected = seleted;
        self.bgImageView.image = [self fetchBackgroundImageWithSize:[self sizeThatFits:CGSizeZero]];
        UIFont * font = seleted ? [UIFont ml_boldFontWithSize:15.f] : [UIFont ml_fontWithSize:15.f];
        self.button.titleLabel.font = font;
        UIColor * borderColor = seleted ? [UIColor ml_tintColor] : [UIColor colorWithWhite:0.f alpha:0.9];
        self.button.layer.borderColor = borderColor.CGColor;
        [self setNeedsDisplay];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgImageView.frame = self.bounds;
    self.button.frame = self.bounds;
    self.button.height = self.height - 7.f; // selected下箭头.
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView)
    {
//        _bgImageView = [[UIImageView alloc] init];
//        _bgImageView.userInteractionEnabled = YES;
    }
    return _bgImageView;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [[UIButton alloc] init];
        [_button setTitleColor:[UIColor colorWithWhite:0.f alpha:.7f] forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor ml_tintColor] forState:UIControlStateSelected];
        _button.titleLabel.font = [UIFont ml_fontWithSize:15.f];
        _button.layer.cornerRadius = 10.f;
        _button.layer.borderWidth = 0.5;
        _button.layer.borderColor = [UIColor colorWithWhite:0.f alpha:0.9].CGColor;
        _button.layer.masksToBounds = YES;
    }
    return _button;
}

- (UIImage *)fetchBackgroundImageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    UIColor * strokeColor = _seleted ? [UIColor ml_tintColor] : [UIColor colorWithWhite:0.f alpha:.9];
    UIColor * fillColor = [UIColor whiteColor];
    CGContextSetFillColorWithColor(cxt, strokeColor.CGColor);
    CGContextSetFillColorWithColor(cxt, fillColor.CGColor);
    CGContextSetLineWidth(cxt, 0.5);
    
    CGFloat radius = 10.f;
    CGContextMoveToPoint(cxt, size.width, size.height - radius);
    CGContextAddArcToPoint(cxt, size.width, size.height, size.width - radius, size.height, radius); // 右下角
    CGContextAddArcToPoint(cxt, 0.f, size.height, 0.f, size.height - radius, radius); // 左下角
    CGContextAddArcToPoint(cxt, 0.f, 0.f, radius, 0.f, radius); // 左上角
    CGContextAddArcToPoint(cxt, size.width, 0.f, size.width, radius, radius); // 右上角
    CGContextClosePath(cxt);
    CGContextDrawPath(cxt, kCGPathFillStroke);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
