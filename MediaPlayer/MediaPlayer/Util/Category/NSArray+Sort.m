//  ************************************************************************
//
//  NSArray+Sort.m
//  StudentLive
//
//  Created by hefanghui on 2016/11/10.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//
//  Main function:数组排序
//
//  Other specifications:
//
//  ************************************************************************

#import "NSArray+Sort.h"

@implementation NSArray (Sort)

- (NSArray *)sortWithKeyToInt:(NSString *)key ascending:(BOOL)ascending {
    return [self sortWithKeyArrayToInt:@[key] ascending:ascending];
}

- (NSArray *)sortWithKeyArrayToInt:(NSArray *)keyArray ascending:(BOOL)ascending {
    if (![self pc_isValidatedDataType]) {
        return self;
    }
    if (self.count == 0) {
        return self;
    }
    if (![self pc_couldSortedByKeyArray:keyArray]) {
        return self;
    }
    NSComparator cmptr = ^(id obj1, id obj2) {
        for (int i = 0; i < keyArray.count; ++i) {
            NSString *key = keyArray[i];
            NSString *value1 = [obj1 objectForKey:key];
            NSString *value2 = [obj2 objectForKey:key];
            if ([value1 integerValue] > [value2 integerValue]) {
                if (ascending) {
                        return (NSComparisonResult)NSOrderedDescending;
                }
                return (NSComparisonResult)NSOrderedAscending;
            } else if ([value1 integerValue] < [value2 integerValue]) {
                if (ascending) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedDescending;
            } else if ([value1 integerValue] == [value2 integerValue] && i != keyArray.count - 1) {
                continue;
            } else {
                return (NSComparisonResult)NSOrderedSame;
            }
        }
        return (NSComparisonResult)NSOrderedSame;
    };
    NSArray *sortedArray = [self sortedArrayUsingComparator:cmptr];
    return sortedArray;
}

- (BOOL)pc_isValidatedDataType {
    if (self.count == 0) {
        return YES;
    }
    if ([self isKindOfClass:[NSArray class]] ||
        [self isKindOfClass:[NSMutableArray class]]) {
        for (int i = 0; i < self.count; ++i) {
            if (!([self[i] isKindOfClass:[NSDictionary class]] ||
                  [self[i] isKindOfClass:[NSMutableDictionary class]])) {
                return NO;
            }
        }
        return YES;
    }
    return NO;
}

- (BOOL)pc_couldSortedByKeyArray:(NSArray *)keyArray {
    for (NSDictionary *dict in self) {
        for (NSString *key in keyArray) {
            NSString *value = dict[key];
            if (value == nil || [value isEqualToString:@""] ) {
                return NO;
            }
        }
    }
    return YES;
}

- (BOOL)pc_couldSortedByKey:(NSString *)key {
    BOOL yesOrNo = [self pc_couldSortedByKeyArray:@[key]];
    return yesOrNo;
}

- (NSComparator)pc_compare {
    return ^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };
}

@end
