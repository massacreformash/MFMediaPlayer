//
//  UIScrollView+KeyBoard.m
//  StudentLive
//
//  Created by hefanghui on 2017/10/23.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import "UIScrollView+KeyBoard.h"
#import <objc/runtime.h>

const char *kLastScrollOffsetY = "kLastScrollOffsetY";

@interface UIScrollView() <UIScrollViewDelegate>

@end

@implementation UIScrollView (KeyBoard)

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    MPLog(@"dealloc");
}

- (void)configDelegateAndKeyBoardMonitor {
    self.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    self.lastScrollOffsetY = 0;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y < self.lastScrollOffsetY) {
        [scrollView endEditing:YES];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.lastScrollOffsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.lastScrollOffsetY = 0;
}

- (void)setLastScrollOffsetY:(CGFloat)lastScrollOffsetY {
    objc_setAssociatedObject(self, kLastScrollOffsetY, @(lastScrollOffsetY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lastScrollOffsetY {
    CGFloat lastScrollOffsetY = [objc_getAssociatedObject(self, kLastScrollOffsetY) doubleValue];
    return lastScrollOffsetY;
}

@end
