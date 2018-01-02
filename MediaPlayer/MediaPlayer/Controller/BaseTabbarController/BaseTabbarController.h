//
//  BaseTabbarController.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^TabbarControllerShouldHijackHandler)(UITabBarController *tabbarController, UIViewController *viewController);
typedef BOOL(^TabBarControllerDidHijackHandler)(UITabBarController *tabbarController, UIViewController *viewController);

@interface BaseTabbarController : UITabBarController

@end
