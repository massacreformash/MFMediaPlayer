//
//  NSArray+Json.m
//  StudentLive
//
//  Created by hyt on 2017/11/14.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import "NSArray+Json.h"

@implementation NSArray (Json)
- (NSString *)toReadableJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

@end
