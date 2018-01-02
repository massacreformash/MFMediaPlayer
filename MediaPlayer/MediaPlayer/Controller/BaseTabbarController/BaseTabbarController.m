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
@property (nonatomic, copy) TabbarControllerShouldHijackHandler shouldHijackHandler;
@property (nonatomic, copy) TabBarControllerDidHijackHandler didHijachHandler;

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initOwnProperties];
}

#pragma mark - init
- (void)p_initOwnProperties {
    self.ignoreNextSelection = false;
}

@end
