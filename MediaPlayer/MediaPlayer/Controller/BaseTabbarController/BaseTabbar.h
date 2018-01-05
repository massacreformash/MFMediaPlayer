//
//  BaseTabbar.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BaseTabbarItemPositioning) {
    TABBAR_POSITIONING_AUTOMATIC,
    TABBAR_POSITIONING_FILL,
    TABBAR_POSITIONING_CENTERED,
    TABBAR_POSITIONING_FILLEXCLUDESEPARATOR,
    TABBAR_POSITIONING_FILLINCLUDESEPARATOR
};

@protocol BaseTabbarDelegate

- (BOOL)baseTabbar:(UITabBar *)tabbar shouldSelectWithItem:(UITabBarItem *)tabbarItem;
- (BOOL)baseTabbar:(UITabBar *)tabbar shouldHookWithItem:(UITabBarItem *)tabbarItem;
- (void)baseTabbar:(UITabBar *)tabbar didHookedWithItem:(UITabBarItem *)tabbarItem;

@end

@interface BaseTabbar : UITabBar

@property (nonatomic, weak) NSObject <BaseTabbarDelegate>*customDelegate;
@property (nonatomic, weak) UITabBarController *tabbarController;

@end

@interface BaseTabbar (layout)

- (void)setupLayout;

@end

@interface BaseTabbar (actions)

- (void)p_reload;
- (void)highlightAction:(id)sender;
- (void)dehilightedAction:(id)sender;
- (void)selectAction:(id)sender;
- (void)selectWithItemIndex:(NSInteger)idx animated:(BOOL)animated;

@end
