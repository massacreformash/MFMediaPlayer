//
//  BaseTabbarBadgeView.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultBadgeColor [UIColor colorWithRed:255 / 255.0 green:59 / 255.0 blue:48 / 255.0 alpha:1.0];

@interface BaseTabbarBadgeView : UIView

@property (nonatomic, strong) UIColor *badgeColor;
@property (nonatomic, copy) NSString *badgeValue;

@end
