//
//  UIButton+BackGroundColor.m
//  StudentLive
//
//  Created by hefanghui on 2017/7/28.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:设置Button不同状态下的背景色
//
//  Other specifications:
//
//  ************************************************************************

#import "UIButton+BackGroundColor.h"

@implementation UIButton (BackGroundColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton p_imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)p_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
