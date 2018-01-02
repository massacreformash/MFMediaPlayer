//
//  NSString+TimeStamp.m
//  StudentLive
//
//  Created by tianyu on 16/7/31.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//

#import "NSString+TimeStamp.h"
#import "NSString+Extention.h"

@implementation NSString (TimeStamp)

+ (NSString *)timeWithTimeStamp:(NSString *)timeStamp
                withTimeFormate:(NSString *)formate
                     hasWeekDay:(BOOL)hasWeekDay {
    if (![timeStamp neitherNilNorEmpty]) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *createTimeStr = [formatter stringFromDate:date];
    NSMutableString *createTimeStrM = [NSMutableString string];
    if (hasWeekDay) {
        NSArray *createTimeArray = [createTimeStr componentsSeparatedByString:@" "];
        NSString *weekday = [timeStamp weekDay];
        if (createTimeArray.count == 1) {
            [createTimeStrM appendString:createTimeArray.firstObject];
            [createTimeStrM appendFormat:@" %@", weekday];
        } else if (createTimeArray.count == 2) {
            [createTimeStrM appendString:createTimeArray.firstObject];
            [createTimeStrM appendFormat:@" %@", weekday];
            [createTimeStrM appendFormat:@" %@", createTimeArray[1]];
        }
        return createTimeStrM.copy;
    } else {
        return createTimeStr;
    }
}

+ (NSString *)timeStampWithFormate:(NSString *)formate formateDate:(NSString *)formateDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSDate *date = [dateFormatter dateFromString:formateDate];
    NSTimeInterval timeInterval =[date timeIntervalSince1970];
    NSTimeInterval time = timeInterval;
    NSString *birthdayStr = [NSString stringWithFormat:@"%lf",time];
    return birthdayStr;
}

+ (NSString *)formateDateWithTimeStamp:(NSString *)timeStamp formate:(NSString *)formate {
    if (![timeStamp neitherNilNorEmpty]) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *createTimeStr = [formatter stringFromDate:date];
    return createTimeStr;
}

+ (NSInteger)timeIntervalBetweenNowAndFormateTime:(NSString *)time {
    NSString *paramTime = [self timeStampWithFormate:@"yyyy-MM-dd HH-mm-ss" formateDate:time];
    NSInteger classTime = [paramTime integerValue];
    NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
    NSInteger intervalSecondsTime = (classTime - nowTime);
    return intervalSecondsTime;
}

+ (NSTimeInterval)secondBetweenStartTime:(NSString *)startTime endTime:(NSString *)endTime {
    if (!([startTime neitherNilNorEmpty] && [endTime neitherNilNorEmpty])) {
        return 0;
    }
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:[startTime doubleValue]];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[endTime doubleValue]];
    NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
    return interval;
}

+ (BOOL)isTimeInOneDayWithStartTime:(NSString *)startTime
                            endTime:(NSString *)endTime {
    NSString *startDate = [NSString formateDateWithTimeStamp:startTime formate:@"yyyy-M-d"];
    NSString *endDate = [NSString formateDateWithTimeStamp:endTime formate:@"yyyy-M-d"];
    return [startDate isEqualToString:endDate];
}

- (NSString *)weekDay {
    if (![self neitherNilNorEmpty]) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    //    NSDate *date = [NSDate date];
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    // 周几和星期几获得
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    comps = [calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
                        fromDate:date];
#pragma clang diagnostic pop
    //    NSInteger week = [comps week]; // 今年的第几周
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    //    NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周
    //    STDLog(@"week:%ld weekday: %ld weekday ordinal: %ld", week, weekday, weekdayOrdinal);
    NSArray *weekArray = [self weekArray];
    return weekArray[weekday];
}

- (NSArray *)weekArray {
    return @[@"", @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
}

@end
