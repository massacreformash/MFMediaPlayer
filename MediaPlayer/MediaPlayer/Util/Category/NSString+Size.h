//
//  NSString+Size.h
//  StudentLive
//
//  Created by hefanghui on 2017/7/26.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width;

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing;

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
                 lineCount:(NSInteger)lineCount;

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(NSInteger)fontSize
                     width:(CGFloat)width
                attributes:(NSDictionary *)attributes
                 lineCount:(NSInteger)lineCount;

+ (CGSize)sizeForString:(NSString *)value
               fontSize:(float)fontSize;

+ (CGSize)sizeForAttributeString:(NSAttributedString *)value;

+ (CGSize)sizeForAttributeString:(NSAttributedString *)value width:(CGFloat)width;

+ (BOOL)isSingeLineWithString:(NSAttributedString *)value width:(CGFloat)width;

+ (BOOL)isSingeLineWithString:(NSString *)value
                     fontSize:(CGFloat)fontSize
                        width:(CGFloat)width
                  lineSpacing:(CGFloat)lineSpacing;

@end
