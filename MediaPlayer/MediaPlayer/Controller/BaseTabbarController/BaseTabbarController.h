//
//  BaseTabbarController.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^TabbarControllerShouldHookHandler)(UITabBarController *tabbarController,
                                                 UIViewController *viewController,
                                                 NSInteger index);
typedef BOOL(^TabBarControllerDidHookHandler)(UITabBarController *tabbarController,
                                              UIViewController *viewController,
                                              NSInteger index);

@interface BaseTabbarController : UITabBarController

+ (void)printError:(NSString *)description;

@end
