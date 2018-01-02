//
//  UIView+CurrentViewController.m
//  StudentLive
//
//  Created by hanyutong on 2017/7/31.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import "UIView+CurrentViewController.h"

@implementation UIView (CurrentViewController)

- (UIViewController *)viewController {
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

@end
