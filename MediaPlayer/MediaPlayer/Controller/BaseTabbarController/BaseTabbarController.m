//
//  BaseTabbarController.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbarController.h"

@interface BaseTabbarController ()

@property (nonatomic, assign) BOOL ignoreNextSelection;
@property (nonatomic, copy) TabbarControllerShouldHookHandler shouldHookHandler;
@property (nonatomic, copy) TabBarControllerDidHookHandler didHookHandler;

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initOwnProperties];
}

#pragma mark - setter
- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController {
    [super setSelectedViewController:selectedViewController];
    
}

#pragma mark - init
- (void)p_initOwnProperties {
    self.ignoreNextSelection = false;
}

@end
