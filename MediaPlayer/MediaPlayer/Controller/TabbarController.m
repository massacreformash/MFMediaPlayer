//
//  TabbarController.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/5.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "TabbarController.h"
#import "BaseTabbarItem.h"

@interface TabbarController ()

@end

@implementation TabbarController

+ (instancetype)baseTabBarViewController {
    TabbarController *viewController = [[TabbarController alloc] init];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_initChildrenViewControllers];
}

- (void)p_initChildrenViewControllers {
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    DocumentViewController *documentVC = [[DocumentViewController alloc] init];
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    
    homeVC.tabBarItem = [[BaseTabbarItem alloc] initWithContentView:nil
                                                              title:@"Home"
                                                              image:[UIImage imageNamed:@"home"]
                                                      selectedImage:[UIImage imageNamed:@"home_1"]
                                                                tag:1];
    documentVC.tabBarItem = [[BaseTabbarItem alloc] initWithContentView:nil
                                                                  title:@"Home"
                                                                  image:[UIImage imageNamed:@"favor"]
                                                          selectedImage:[UIImage imageNamed:@"favor_1"]
                                                                    tag:2];
    settingsVC.tabBarItem = [[BaseTabbarItem alloc] initWithContentView:nil
                                                                  title:@"Home"
                                                                  image:[UIImage imageNamed:@"me"]
                                                          selectedImage:[UIImage imageNamed:@"me_1"]
                                                                    tag:3];
    homeVC.title = @"Home";
    documentVC.title = @"Document";
    settingsVC.title = @"Settings";
    
//    BaseNavigationViewController *homeNav = [[BaseNavigationViewController alloc] initWithRootViewController:homeVC];
//    BaseNavigationViewController *myCourseNav = [[BaseNavigationViewController alloc] initWithRootViewController:myCourseVC];
//    BaseNavigationViewController *mineNav = [[BaseNavigationViewController alloc] initWithRootViewController:mineVC];
    self.viewControllers = @[homeVC, documentVC, settingsVC];
}

//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
//    return true;
//}

@end
