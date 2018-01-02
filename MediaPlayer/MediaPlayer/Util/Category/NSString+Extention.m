//
//  NSString+Extention.m
//  StudentLive
//
//  Created by hefanghui on 16/5/17.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//
//  Main function:字符串通用方法分类
//
//  Other specifications:
//
//  ************************************************************************


#import "NSString+Extention.h"

@implementation NSString (Extention)

- (BOOL)neitherNilNorEmpty {
    if (![@"" isEqualToString:self] && nil != self && NULL != self) {
        return YES;
    }
    return NO;
}

- (NSString *)lastCharacter {
    if ([self neitherNilNorEmpty] && self.length > 1) {
        NSString *lastString = [self substringFromIndex:self.length - 1];
        return lastString;
    }
    return self;
}

- (NSString *)deletePrefixAndSuffixSpacestring {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)stringFromFloatNumber:(CGFloat)floatNumber {
    if (fmodf(floatNumber, 1) == 0) {
        return [NSString stringWithFormat:@"%.0f",floatNumber];
    } else if (fmodf(floatNumber*10, 1) == 0) {
        return [NSString stringWithFormat:@"%.1f",floatNumber];
    } else {
        return [NSString stringWithFormat:@"%.2f",floatNumber];
    }
}

@end
