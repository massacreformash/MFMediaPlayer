//
//  UIView+CornerRadius.m
//  StudentLive
//
//  Created by hefanghui on 2017/3/1.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:指定UIView的某几个角为圆角
//
//  Other specifications:
//
//  ************************************************************************

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)setCornerSize:(CGSize)size rectCornerType:(UIRectCorner)type {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:type
                                                         cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setCornerRadius:(CGFloat)radius rectCornerType:(UIRectCorner)type {
    [self setCornerSize:CGSizeMake(radius, radius) rectCornerType:type];
}

@end
