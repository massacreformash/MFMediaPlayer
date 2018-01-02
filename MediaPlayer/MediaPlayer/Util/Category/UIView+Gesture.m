//
//  UIView+Gesture.m
//  StudentLive
//
//  Created by 龚昕炜 on 2017/8/1.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)

#pragma mark - addResignFirstResponderTapGesture
- (void)addResignFirstResponderTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.delegate = self;
    [tap addTarget:self action:@selector(p_resignFirstResponder)];
    [self addGestureRecognizer:tap];
}

- (void)p_resignFirstResponder {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
    UIView *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
#pragma clang diagnostic pop
    [firstResponder resignFirstResponder];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch {
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"] ||
        [NSStringFromClass([touch.view class]) isEqualToString:@"LateReasonTextView"] ||
        [NSStringFromClass([touch.view class]) isEqualToString:@"HQTextView"] ||
        [NSStringFromClass([touch.view class]) isEqualToString:@"LiveChatToolView"]) {
        return NO;
    }
    return  YES;
}

@end
