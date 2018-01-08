//
//  UIViewController+BaseNavigationBar.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/8.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BaseNavigationBar)

@property (nonatomic, strong) UIView *customNavigationBar;
@property (nonatomic, strong) UIButton *navMiddleButton;
@property (nonatomic, strong) UIButton *navLeftButton;
@property (nonatomic, strong) UIButton *navRightButton;
@property (nonatomic, assign) BOOL isPushed;

@end
