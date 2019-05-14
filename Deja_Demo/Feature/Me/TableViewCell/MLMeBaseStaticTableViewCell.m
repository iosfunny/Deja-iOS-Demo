//
//  MLMeBaseStaticTableViewCell.m
//  Deja_Demo
//
//  Created by mozat on 2019/5/14.
//  Copyright © 2019 xiaozf. All rights reserved.
//

#import "MLMeBaseStaticTableViewCell.h"

@implementation MLMeBaseStaticTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self addSubview:self.titleLabel];
        self.backgroundColor = [UIColor ml_defaultBGColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(15.f, 0.f, self.width - 30.f, self.height);
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont ml_fontWithSize:15.f];
    }
    return _titleLabel;
}

@end
