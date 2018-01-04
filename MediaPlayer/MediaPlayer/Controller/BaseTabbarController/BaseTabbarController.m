//
//  BaseTabbarController.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseTabbar.h"

@interface BaseTabbarController () <BaseTabbarDelegate>

@property (nonatomic, assign) BOOL ignoreNextSelection;
@property (nonatomic, copy) TabbarControllerShouldHookHandler shouldHookHandler;
@property (nonatomic, copy) TabBarControllerDidHookHandler didHookHandler;

@end

@implementation BaseTabbarController

+ (void)printError:(NSString *)description {
#if DEBUG
    MPLog(@"%@", description);
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initOwnProperties];
    BaseTabbar *tabbar = [[BaseTabbar alloc] init];
    tabbar.delegate = self;
    tabbar.customDelegate = self;
    tabbar.tabbarController = self;
    
    [self setValue:tabbar forKey:@"tabBar"];
}

#pragma mark - setter
- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController {
    [super setSelectedViewController:selectedViewController];
    
}

#pragma mark - init
- (void)p_initOwnProperties {
    self.ignoreNextSelection = false;
}

#pragma mark - Tabbar Delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index == NSNotFound) {
        return;
    }
    UIViewController *controller = self.viewControllers[index];
    if (controller != nil) {
        self.ignoreNextSelection = true;
        self.selectedIndex = index;
        if (self.delegate) {
            [self.delegate tabBarController:self didSelectViewController:controller];
        }
    }
}

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    if ([tabBar isKindOfClass:[BaseTabbar class]]) {
        [(BaseTabbar *)tabBar setupLayout];
    }
}

- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed {
    if ([tabBar isKindOfClass:[BaseTabbar class]]) {
        [(BaseTabbar *)tabBar setupLayout];
    }
}

#pragma mark - BaseTabbar delegate
- (void)baseTabbar:(UITabBar *)tabbar didHookedWithItem:(UITabBarItem *)tabbarItem {
    NSInteger index = [self.tabBar.items indexOfObject:tabbarItem];
    if (index == NSNotFound) {
        return;
    }
    UIViewController *controller = self.viewControllers[index];
    if (controller != nil) {
        self.didHookHandler(self, controller, index);
    }
}

- (BOOL)baseTabbar:(UITabBar *)tabbar shouldHookWithItem:(UITabBarItem *)tabbarItem {
    NSInteger index = [self.tabBar.items indexOfObject:tabbarItem];
    if (index == NSNotFound) {
        return false;
    }
    UIViewController *controller = self.viewControllers[index];
    if (controller != nil) {
        return self.shouldHookHandler(self, controller, index);
    }
    return false;
}

- (BOOL)baseTabbar:(UITabBar *)tabbar shouldSelectWithItem:(UITabBarItem *)tabbarItem {
    NSInteger index = [self.tabBar.items indexOfObject:tabbarItem];
    if (index == NSNotFound) {
        return false;
    }
    UIViewController *controller = self.viewControllers[index];
    if (controller != nil) {
        if (self.delegate) {
            return [self.delegate tabBarController:self shouldSelectViewController:controller];
        } else {
            return false;
        }
    }
    return false;
}

@end
