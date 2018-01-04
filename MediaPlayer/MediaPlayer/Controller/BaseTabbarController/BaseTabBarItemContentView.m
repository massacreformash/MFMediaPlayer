//
//  BaseTabBarItemContentView.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabBarItemContentView.h"
#import "BaseTabbarBadgeView.h"

@interface BaseTabBarItemContentView ()

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL highlighted;
@property (nonatomic, assign) BOOL highlightedEnabled;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *highlightedTextColor;

@property (nonatomic, strong) UIColor *iconColor;
@property (nonatomic, strong) UIColor *highlightedIconColor;

@property (nonatomic, strong) UIColor *backdropColor;
@property (nonatomic, strong) UIColor *highlightedBackdropColor;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) UIImageRenderingMode renderingMode;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) BaseTabbarBadgeView *badgeView;
@property (nonatomic, assign) UIOffset badgeOffset;

@end

@implementation BaseTabBarItemContentView

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
    self.userInteractionEnabled = false;
    
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    
    self.titleLabel.textColor = self.textColor;
    self.imageView.tintColor = self.iconColor;
    self.backgroundColor = self.backdropColor;
    
    [self setupLayouts];
}

- (void)p_setupDisplay {
    UIImage *image = self.selected ? (!self.selecedImage ? self.image : self.selecedImage) : self.image;
    self.imageView.image = [image imageWithRenderingMode:self.renderingMode];
    
    self.imageView.tintColor = self.selected ? self.highlightedIconColor : self.iconColor;
    self.titleLabel.textColor = self.selected ? self.highlightedTextColor : self.textColor;
    self.backgroundColor = self.selected ? self.highlightedBackdropColor : self.backdropColor;
}

- (void)setupLayouts {
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    BOOL isWide = isLandscape || (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular);
    CGFloat s = 0.0;    //image size
    CGFloat f = 0.0;    //font
    
    self.imageView.hidden = self.imageView.image == nil;
    self.titleLabel.hidden = self.titleLabel.text == nil;
    
    if (isWide) {
        s = SCREEN_SCALE == 3.0 ? 23.0 : 20.0;
        f = SCREEN_SCALE == 3.0 ? 13.0 : 12.0;
    } else {
        s = 23.0;
        f = 13.0;
    }
    
    if (!self.imageView.hidden && !self.titleLabel.hidden) {
        self.titleLabel.font = [UIFont systemFontOfSize:f];
        [self.titleLabel sizeToFit];
        
        if (isWide) {
            self.titleLabel.frame = CGRectMake((w - self.titleLabel.width / 2.0 + (SCREEN_SCALE == 3.0 ? 14.25 : 12.25)),
                                               (h - self.titleLabel.height / 2.0),
                                               self.titleLabel.width,
                                               self.titleLabel.height);
            self.imageView.frame = CGRectMake((self.titleLabel.origin.x / 2.0 - s - (SCREEN_SCALE == 3.0 ? 6.0 : 5.0)),
                                              ((h - s) / 2.0),
                                              s,
                                              s);
        } else {
            self.titleLabel.frame = CGRectMake((w - self.titleLabel.width / 2.0),
                                               (h - self.titleLabel.height - 1.0),
                                               self.titleLabel.width,
                                               self.titleLabel.height);
            self.imageView.frame = CGRectMake(((w - s) / 2.0),
                                              ((h - s) / 2.0 - 6.0),
                                              s,
                                              s);
        }
    } else if (!self.imageView.hidden) {
        self.imageView.frame = CGRectMake(((w - s) / 2.0),
                                          ((h - s) / 2.0 - 6.0),
                                          s,
                                          s);
    } else if (!self.titleLabel.hidden) {
        self.titleLabel.font = [UIFont systemFontOfSize:f];
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake((w - self.titleLabel.width / 2.0),
                                           (h - self.titleLabel.height / 2.0),
                                           self.titleLabel.width,
                                           self.titleLabel.height);
    }
    
    if (self.badgeView.superview != nil) {
        CGSize badgeSize = [self.badgeView sizeThatFits:self.frame.size];
        self.badgeView.frame = CGRectMake(w / 2.0 + self.badgeOffset.horizontal,
                                          h / 2.0 + self.badgeOffset.vertical,
                                          badgeSize.width,
                                          badgeSize.height);
        [self.badgeView setNeedsLayout];
    }
}

- (void)selectWithAnimation:(BOOL)animated completion:(void(^)(void))completion {
    self.selected = true;
    if (self.highlightedEnabled == true && self.highlighted == true) {
        self.highlighted = false;
        [self dehighlightAnimation:animated completion:^{
            [self p_setupDisplay];
            [self selectAnimation:animated completion:completion];
        }];
    } else {
        [self p_setupDisplay];
        [self selectAnimation:animated completion:completion];
    }
}

- (void)deselectWithAnimation:(BOOL)animated completion:(void(^)(void))completion {
    self.selected = false;
    [self p_setupDisplay];
    [self deselectWithAnimation:animated completion:completion];
}

- (void)reselectWithAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (self.selected == false) {
        [self selectAnimation:animated completion:completion];
    } else {
        if (self.highlightedEnabled == true && self.highlighted == true) {
            self.highlighted = false;
            [self dehighlightAnimation:animated completion:^{
                [self reselectWithAnimation:animated completion:completion];
            }];
        } else {
            [self reselectWithAnimation:animated completion:completion];
        }
    }
}

- (void)highlightWithAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (self.highlightedEnabled == false) {
        return;
    }
    if (self.highlighted == true) {
        return;
    }
    self.highlighted = true;
    [self highlightAnimation:animated completion:completion];
}

- (void)dehighlightWithAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (self.highlightedEnabled == false) {
        return;
    }
    if (self.highlighted == false) {
        return;
    }
    self.highlighted = false;
    [self dehighlightAnimation:animated completion:completion];
}

- (void)badgeChangedWithAnimation:(BOOL)animated completion:(void(^)(void))completion {
    [self badgeChangedAnimation:animated completion:completion];
}

#pragma mark - animations
- (void)selectAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (completion) {
        completion();
    }
}

- (void)deselectAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (completion) {
        completion();
    }
}

- (void)reselectAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (completion) {
        completion();
    }
}

- (void)highlightAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (completion) {
        completion();
    }
}

- (void)dehighlightAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (completion) {
        completion();
    }
}

- (void)badgeChangedAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (completion) {
        completion();
    }
}

#pragma mark - setters
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    if (!self.selected) {
        self.titleLabel.textColor = textColor;
    }
}

- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor {
    _highlightedTextColor = highlightedTextColor;
    if (self.selected) {
        self.titleLabel.textColor = highlightedTextColor;
    }
}

- (void)setIconColor:(UIColor *)iconColor {
    _iconColor = iconColor;
    if (!self.selected) {
        self.imageView.tintColor = iconColor;
    }
}

- (void)setHighlightedIconColor:(UIColor *)highlightedIconColor {
    _highlightedIconColor = highlightedIconColor;
    if (self.selected) {
        self.imageView.tintColor = highlightedIconColor;
    }
}

- (void)setBackdropColor:(UIColor *)backdropColor {
    _backdropColor = backdropColor;
    if (!self.selected) {
        self.backgroundColor = backdropColor;
    }
}

- (void)setHighlightedBackdropColor:(UIColor *)highlightedBackdropColor {
    _highlightedBackdropColor = highlightedBackdropColor;
    if (self.selected) {
        self.backgroundColor = highlightedBackdropColor;
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self setupLayouts];
}

- (void)setRenderingMode:(UIImageRenderingMode)renderingMode {
    _renderingMode = renderingMode;
    [self p_setupDisplay];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    if (!self.selected) {
        [self p_setupDisplay];
    }
}

- (void)setSelecedImage:(UIImage *)selecedImage {
    _selecedImage = selecedImage;
    if (self.selected) {
        [self p_setupDisplay];
    }
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    if ([badgeValue neitherNilNorEmpty]) {
        self.badgeView.badgeValue = badgeValue;
        [self addSubview:self.badgeView];
        [self setupLayouts];
    } else {
        [self.badgeView removeFromSuperview];
    }
    [self badgeChangedWithAnimation:true completion:nil];
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    _badgeColor = badgeColor;
    if (badgeColor != nil) {
        self.badgeView.badgeColor = badgeColor;
    } else {
        self.badgeView.badgeColor = kDefaultBadgeColor;
    }
}

- (void)setBadgeView:(BaseTabbarBadgeView *)badgeView {
    _badgeView = badgeView;
    if (!badgeView.superview) {
        [self.badgeView removeFromSuperview];
    } else {
        [self setupLayouts];
    }
}

- (void)setBadgeOffset:(UIOffset)badgeOffset {
    UIOffset oldValue = _badgeOffset;
    _badgeOffset = badgeOffset;
    if (!UIOffsetEqualToOffset(_badgeOffset, oldValue)) {
        [self setupLayouts];
    }
}

#pragma mark - lazyloads
- (UIImageView *)imageView {
    if (_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor clearColor];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:T7_26PX];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark - init
- (void)p_initOwnProperties {
    self.insets = UIEdgeInsetsZero;
    self.selected = false;
    self.highlighted = false;
    self.highlightedEnabled = true;
    
    self.textColor = [UIColor colorWithWhite:0.57254902 alpha:1.0];
    self.highlightedTextColor = [UIColor colorWithRed:0.0 green:0.47843137 blue:1.0 alpha:1.0];
    
    self.iconColor = [UIColor colorWithWhite:0.57254902 alpha:1.0];
    self.highlightedIconColor = [UIColor colorWithRed:0.0 green:0.47843137 blue:1.0 alpha:1.0];
    
    self.backdropColor = [UIColor clearColor];
    self.highlightedBackdropColor = [UIColor clearColor];
    
    self.renderingMode = UIImageRenderingModeAlwaysTemplate;
}

@end
