//
//  BaseTabbarBadgeView.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbarBadgeView.h"

@interface BaseTabbarBadgeView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation BaseTabbarBadgeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initOwnProperties];
        [self p_setupUI];
    }
    return self;
}

#pragma mark - handle views
- (void)p_setupUI {
    [self addSubview:self.imageView];
    [self addSubview:self.badgeLabel];
    self.imageView.backgroundColor = self.badgeColor;
    
    [self p_setupLayouts];
}

- (void)p_setupLayouts {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (![self.badgeValue neitherNilNorEmpty]) {
        self.imageView.hidden = true;
        self.badgeLabel.hidden = true;
        return;
    }
    
    self.imageView.hidden = false;
    self.badgeLabel.hidden = false;
    self.imageView.frame = self.bounds;
    
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.height / 2.0;
    [self.badgeLabel sizeToFit];
    self.badgeLabel.center = self.imageView.center;
}

- (CGSize)sizeThatFits:(CGSize)size {
    [super sizeThatFits:size];
    
    if (![self.badgeValue neitherNilNorEmpty]) {
        return CGSizeMake(18.0, 18.0);
    }
    
    CGSize textSize = [self.badgeLabel sizeThatFits:CGSizeMake(FLT_MAX, FLT_MAX)];
    return CGSizeMake(MAX(18.0, textSize.width + 10.0), 18.0);
}

#pragma mark - setter
- (void)setBadgeColor:(UIColor *)badgeColor {
    _badgeColor = badgeColor;
    self.imageView.backgroundColor = badgeColor;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    self.badgeLabel.text = badgeValue;
}

#pragma mark - lazyLoads
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor clearColor];
    }
    return _imageView;
}

- (UILabel *)badgeLabel {
    if (!_badgeLabel) {
        _badgeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _badgeLabel.backgroundColor = [UIColor clearColor];
        _badgeLabel.font = [UIFont systemFontOfSize:T7_26PX];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _badgeLabel;
}

#pragma mark - init
- (void)p_initOwnProperties {
    self.backgroundColor = kDefaultBadgeColor;
}

@end
