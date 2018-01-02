//
//  UILabel+Extention.m
//  StudentLive
//
//  Created by hefanghui on 2017/7/28.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:UILabel常用方法分类
//
//  Other specifications:便利构造、设置富文本等
//
//  ************************************************************************

#import "UILabel+Extention.h"

@implementation UILabel (Extention)

+ (instancetype)labelWithTitle:(NSString *)title
                      fontSize:(CGFloat)fontSize
                         color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    if (title != nil && ![@"" isEqualToString:title]) {
        label.text = title;
    }
    if (color != nil) {
        label.textColor = color;
    }
    label.font = [UIFont systemFontOfSize:fontSize];
    [label sizeToFit];
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)title
                      fontSize:(CGFloat)fontSize
                         color:(UIColor *)color
                        isBold:(BOOL)isBold {
    UILabel *label = [[UILabel alloc] init];
    if (title != nil && ![@"" isEqualToString:title]) {
        label.text = title;
    }
    if (isBold) {
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:fontSize];
    } else {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    if (color != nil) {
        label.textColor = color;
    }
    [label sizeToFit];
    return label;
}

- (void)setAttributeWithLineSpacing:(NSInteger)lineSpacing
                           fontSize:(NSInteger)fontSize
                          textColor:(UIColor *)color {
    NSTextAlignment originalTextAlignment = self.textAlignment;
    NSString *labelText = self.text;
    if (labelText != nil && ![@"" isEqualToString:labelText]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpacing;
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary *attributeDictionary = @{NSParagraphStyleAttributeName : paragraphStyle,
                                              NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                                              NSForegroundColorAttributeName : color,
                                              NSBaselineOffsetAttributeName : @(0)};
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:labelText
                                                                     attributes:attributeDictionary];
        self.attributedText = attStr;
        self.textAlignment = originalTextAlignment;
    }
}

@end
