//
//  UIScrollView+KeyBoard.h
//  StudentLive
//
//  Created by hefanghui on 2017/10/23.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (KeyBoard)

@property (nonatomic, assign) CGFloat lastScrollOffsetY;

- (void)configDelegateAndKeyBoardMonitor;

@end
