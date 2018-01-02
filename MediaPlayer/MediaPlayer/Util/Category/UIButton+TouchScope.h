//
//  UIButton+TouchScope.h
//  StudentLive
//
//  Created by hefanghui on 2017/8/7.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TouchScope)

//@property (nonatomic, assign) BOOL shouldShowButtonTouchScope;

/**
 更改按钮的点击范围方法
 
 @param rect (x,y,width,height)   
 x：bounds坐标系的x轴上的的偏移
 y：bounds坐标系的y轴上的的偏移
 width：点击范围的宽度，不能设置为0
 height：点击范围的高度，不能设置为0
 */
- (void)expandTouchScopeRect:(CGRect)rect;

- (void)expandTouchScopeWidthMultiple:(CGFloat)widthMultiple heightMultiple:(CGFloat)heightMultiple;


/**
 显示按钮点击范围
 */
- (void)ShowButtonTouchScope;


/**
 显示按钮点击范围

 @param color 点击范围颜色
 */
- (void)ShowButtonTouchScopeWithColor:(UIColor *)color;

@end
