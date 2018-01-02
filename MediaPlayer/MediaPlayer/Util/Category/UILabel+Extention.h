//
//  UILabel+Extention.h
//  StudentLive
//
//  Created by hefanghui on 2017/7/28.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extention)


/**
 便利构造函数

 @param title 显示文本
 @param fontSize 文本字号
 @param color 文本颜色
 @return 指定参数的UILabel实例
 */
+ (instancetype)labelWithTitle:(NSString *)title
                      fontSize:(CGFloat)fontSize
                         color:(UIColor *)color;


/**
 便利构造函数

 @param title 显示文本
 @param fontSize 文本字号
 @param color 文本颜色
 @param isBold 是否为粗体
 @return 指定参数的UILabel实例
 */
+ (instancetype)labelWithTitle:(NSString *)title
                      fontSize:(CGFloat)fontSize
                         color:(UIColor *)color
                        isBold:(BOOL)isBold;

/**
 给当前label的文本设置行间距、字号、字体颜色

 @param lineSpacing 行间距
 @param fontSize 字号
 @param color 字体颜色
 */
- (void)setAttributeWithLineSpacing:(NSInteger)lineSpacing
                           fontSize:(NSInteger)fontSize
                          textColor:(UIColor *)color;

@end
