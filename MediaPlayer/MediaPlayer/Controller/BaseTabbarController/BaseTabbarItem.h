//
//  BaseTabbarItem.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseTabBarItemContentView;

@interface BaseTabbarItem : UITabBarItem

@property (nonatomic, strong) BaseTabBarItemContentView *contentView;

@end
