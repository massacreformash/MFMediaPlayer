//
//  BaseTabbarItem.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbarItem.h"
#import "BaseTabBarItemContentView.h"

@interface BaseTabbarItem ()

@property (nonatomic, strong) BaseTabBarItemContentView *contentView;

@end

@implementation BaseTabbarItem

- (instancetype)initWithContentView:(BaseTabBarItemContentView *)contentView
                              title:(NSString *)title
                              image:(UIImage *)image
                      selectedImage:(UIImage *)selectedImage
                                tag:(NSInteger)tag {
    self = [super init];
    if (self) {
        if (contentView == nil) {
            self.contentView = [[BaseTabBarItemContentView alloc] initWithFrame:CGRectZero];
        } else {
            self.contentView = contentView;
        }
        [self configTitle:title image:image selectedImage:selectedImage tag:tag];
    }
    return self;
}

- (void)configTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)tag {
    self.title = title;
    self.image = image;
    self.selectedImage = selectedImage;
    self.tag = tag;
}

#pragma mark - setters
-(void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.contentView.title = title;
}

- (void)setImage:(UIImage *)image {
    [super setImage:image];
    self.contentView.image = image;
}

- (void)setSelectedImage:(UIImage *)selectedImage {
    [super setSelectedImage:selectedImage];
    self.contentView.selecedImage = selectedImage;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    [super setBadgeValue:badgeValue];
    self.contentView.badgeValue = badgeValue;
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    [super setBadgeColor:badgeColor];
    self.contentView.badgeColor = badgeColor;
}

- (void)setTag:(NSInteger)tag {
    [super setTag:tag];
    self.contentView.tag = tag;
}

- (NSString *)badgeValue {
    return self.contentView.badgeValue;
}

- (UIColor *)badgeColor {
    return self.contentView.badgeColor;
}

@end
