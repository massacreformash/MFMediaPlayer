//
//  ************************************************************************
//  NSString+Size.m
//  StudentLive
//
//  Created by hefanghui on 2017/7/26.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:计算字符串Size、Height的分类，已经判断是否单行
//
//  Other specifications:
//
//  ************************************************************************

#import "NSString+Extention.h"

@implementation NSString (Size)

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width {
    if (value == nil) {
        return 0;
    }
    NSRange allRange = [value rangeOfString:value];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:value];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:allRange];
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                      context:nil];
    return rect.size.height;
}

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing {
    return [self heightForString:value fontSize:fontSize width:width lineSpacing:lineSpacing lineCount:-1];
}

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
                 lineCount:(NSInteger)lineCount {
    if (![value neitherNilNorEmpty]) {
        return 0;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                            NSParagraphStyleAttributeName : paragraphStyle,
                            NSBaselineOffsetAttributeName : @(0)};
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attrs context:nil];
    CGRect singleLineRect = [@" " boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attrs
                                               context:nil];
    if (rect.size.height <= singleLineRect.size.height) {
        return [NSString heightForString:value fontSize:fontSize width:width];
    }
    if (rect.size.height / singleLineRect.size.height >= lineCount && lineCount > 0) {
        return lineCount * singleLineRect.size.height;
    }
    return rect.size.height;
}

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(NSInteger)fontSize
                     width:(CGFloat)width
                attributes:(NSDictionary *)attributes
                 lineCount:(NSInteger)lineCount {
    if (![value neitherNilNorEmpty]) {
        return 0;
    }
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributes context:nil];
    CGRect singleLineRect = [@" " boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil];
    if (rect.size.height <= singleLineRect.size.height) {
        return [NSString heightForString:value fontSize:fontSize width:width];
    }
    if (rect.size.height / singleLineRect.size.height >= lineCount && lineCount > 0) {
        return lineCount * singleLineRect.size.height;
    }
    return rect.size.height;
}

+ (CGSize)sizeForString:(NSString *)value
               fontSize:(float)fontSize {
    if (value == nil) {
        return CGSizeZero;
    }
    NSRange allRange = [value rangeOfString:value];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:value];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:allRange];
    CGRect rect = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                      context:nil];
    return rect.size;
}

+ (CGSize)sizeForAttributeString:(NSAttributedString *)value {
    if (value == nil) {
        return CGSizeZero;
    }
    CGRect rect = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                      context:nil];
    return rect.size;
}


+ (CGSize)sizeForAttributeString:(NSAttributedString *)value width:(CGFloat)width {
    if (value == nil) {
        return CGSizeZero;
    }
    
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      context:nil];
    return rect.size;
}

+ (BOOL)isSingeLineWithString:(NSAttributedString *)value width:(CGFloat)width {
    if (value == nil) {
        return YES;
    }
    CGRect rect = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      context:nil];
    return (rect.size.width <= width);
}

+ (BOOL)isSingeLineWithString:(NSString *)value
                     fontSize:(CGFloat)fontSize
                        width:(CGFloat)width
                  lineSpacing:(CGFloat)lineSpacing {
    if (value == nil) {
        return 0;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                            NSParagraphStyleAttributeName : paragraphStyle,
                            NSBaselineOffsetAttributeName : @(0)};
    CGRect rect = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attrs
                                      context:nil];
    CGRect singleLineRect = [@" " boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attrs
                                               context:nil];
    if (rect.size.height <= singleLineRect.size.height) {
        return YES;
    }
    return NO;
}

@end
