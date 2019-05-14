//
//  MLUICategoryView.m
//  ProjectBaseService
//
//  Created by mozat on 2019/5/3.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLUICategoryView.h"
#import "MLUIScrollView.h"
#import "MLUICategoryItemView.h"

@interface MLUICategoryView ()

@property (nonatomic, strong) MLUIScrollView * scrollView;
@property (nonatomic, strong) NSMutableArray <MLUICategoryItemView *> * itemViews;

@end

@implementation MLUICategoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _itemViews = [NSMutableArray array];
        [self addSubview:self.scrollView];
    }
    return self;
}

- (void)setDelegate:(id<MLUICategoryViewDelegate>)delegate
{
    if (_delegate != delegate)
    {
        _delegate = delegate;
        [self reloadData];
    }
}

- (void)clicked:(UIButton *)button
{
    NSString * category = button.currentTitle;
    NSInteger index = [[self.delegate categorysOfCategoryView:self] indexOfObject:category];
    if (index != NSNotFound)
    {
        [self.delegate categoryView:self didSelectedAtIndex:index];
    }
}

- (void)reloadData
{
    [self.itemViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSMutableArray <MLUICategoryItemView *> * mutableItemViews = [NSMutableArray array];
    NSArray <NSString *> * categorys = [self.delegate categorysOfCategoryView:self];
    for (NSInteger i = 0; i < categorys.count; i++)
    {
        MLUICategoryItemView * itemView;
        if (self.itemViews.count > i) { itemView = [self.itemViews objectAtIndex:i]; } 
        if (!itemView)
        {
            itemView = [[MLUICategoryItemView alloc] init];
        }
        itemView.seleted = (i == 0);
        NSString * category = [categorys mlsafe_objectAtIndex:i];
        itemView.title = category;
        [itemView addTarget:self action:@selector(clicked:)];
        [mutableItemViews mlsafe_addObject:itemView];
        [self.scrollView addSubview:itemView];
    }
    self.itemViews = mutableItemViews;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    CGFloat left = 15.f;
    for (NSInteger i = 0; i < self.itemViews.count; i++)
    {
        MLUICategoryItemView * itemView = [self.itemViews mlsafe_objectAtIndex:i];
        [itemView sizeToFit];
        itemView.frame = CGRectMake(left, 0.f, itemView.width, itemView.height);
        itemView.centerY = self.height * 0.5;
        left = itemView.right + 15.f;
    }
    self.scrollView.contentSize = CGSizeMake(left, 0.f);
}

- (MLUIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[MLUIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
