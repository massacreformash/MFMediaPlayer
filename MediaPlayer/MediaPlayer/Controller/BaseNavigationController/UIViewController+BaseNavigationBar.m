//
//  UIViewController+BaseNavigationBar.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/8.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "UIViewController+BaseNavigationBar.h"
#import <objc/runtime.h>

const char *kNavigationBarKey = "navigationBar";
const char *kNavMiddleButtonKey = "navMiddleButton";
const char *kNavLeftButtonKey = "navLeftButton";
const char *kNavRightButtonKey = "navRightButton";
const char *kIsPushedKey = "IsPushed";

@implementation UIViewController (BaseNavigationBar)

- (void)p_configCustomNavigationBar {
    if (self.customNavigationBar) {
        
    }
}

#pragma mark - add runtime variables
- (void)setCustomNavigationBar:(UIView *)customNavigationBar {
    objc_setAssociatedObject(self,
                             kNavigationBarKey,
                             customNavigationBar,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)customNavigationBar {
    return objc_getAssociatedObject(self, kNavigationBarKey);
}

- (void)setNavMiddleButton:(UIButton *)navMiddleButton {
    objc_setAssociatedObject(self,
                             kNavMiddleButtonKey,
                             navMiddleButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)navMiddleButton {
    return objc_getAssociatedObject(self, kNavMiddleButtonKey);
}

- (void)setNavLeftButton:(UIButton *)navLeftButton {
    objc_setAssociatedObject(self,
                             kNavLeftButtonKey,
                             navLeftButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)navLeftButton {
    return objc_getAssociatedObject(self, kNavLeftButtonKey);
}

- (void)setNavRightButton:(UIButton *)navRightButton {
    objc_setAssociatedObject(self,
                             kNavRightButtonKey,
                             navRightButton,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)navRightButton {
    return objc_getAssociatedObject(self, kNavRightButtonKey);
}

- (void)setIsPushed:(BOOL)isPushed {
    NSNumber *isPushedNumber = [NSNumber numberWithBool:isPushed];
    objc_setAssociatedObject(self,
                             kIsPushedKey,
                             isPushedNumber,
                             OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isPushed {
    NSNumber *isPushedNumber = objc_getAssociatedObject(self, kIsPushedKey);
    BOOL isPushed = [isPushedNumber boolValue];
    return isPushed;
}

@end
