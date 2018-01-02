//
//  UIView+Frame.h
//  StudentLive
//
//  Created by hefanghui on 2017/7/26.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

- (CGRect)convertRectToView:(UIView *)view;
- (CGFloat)xInView:(UIView *)view;
- (CGFloat)yInView:(UIView *)view;
- (CGFloat)rightInView:(UIView *)view;
- (CGFloat)bottomInView:(UIView *)view;
- (CGFloat)centerXInView:(UIView *)view;
- (CGFloat)centerYInView:(UIView *)view;

@end
