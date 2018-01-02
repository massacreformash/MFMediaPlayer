//
//  NSString+Extention.h
//  StudentLive
//
//  Created by hefanghui on 16/5/17.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extention)

- (BOOL)neitherNilNorEmpty;
- (NSString *)lastCharacter;
- (NSString *)deletePrefixAndSuffixSpacestring;

/**
 *  浮点数转化为两位小数以内string
 *
 *  @param floatNumber      如 3.30
 *
 *  @return @"3.3"
 */
+ (NSString *)stringFromFloatNumber:(CGFloat)floatNumber;

@end
