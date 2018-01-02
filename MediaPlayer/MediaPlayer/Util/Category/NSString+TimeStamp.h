//
//  NSString+TimeStamp.h
//  StudentLive
//
//  Created by tianyu on 16/7/31.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TimeStamp)

/**
 *  时间戳转化为指定格式的时间
 *
 *  @param timeStamp 时间戳如@"-28800"
 *  @param formate   如 M月d日 HH:mm    (不需要的去掉，需要前缀0的就用->MM月dd日 HH:mm --> 06月03日 周一 17:00
                                                                 M月d日          --> 6月3日 周一
                                                                 HH:mm          --> 17:00    )
 *
 *  @return 如1970年01月01日 周一 17:00    （需要周几就传入，不需要哪一项就不传）
 */
+ (NSString *)timeWithTimeStamp:(NSString *)timeStamp
                withTimeFormate:(NSString *)formate
                     hasWeekDay:(BOOL)hasWeekDay;

/**
 *  时间格式转化为时间戳
 *
 *  @param formate      如 yyyy-MM-dd HH-mm-ss
 *  @param formateDate  如输入 2000-01-01
 *
 *  @return @"-28800"
 */
+ (NSString *)timeStampWithFormate:(NSString *)formate formateDate:(NSString *)formateDate;

/**
 *  时间戳转化为指定格式的时间
 *
 *  @param timeStamp 时间戳如@"-28800"
 *  @param formate   如 yyyy-MM-dd HH-mm-ss
 *
 *  @return 如1970-01-01
 */

+ (NSString *)formateDateWithTimeStamp:(NSString *)timeStamp formate:(NSString *)formate;

/*
 *  计算传入时间距离现在的时间间隔（秒数）
 *
 *  @param formate   如 yyyy-MM-dd HH-mm-ss
 *
 */
+ (NSInteger)timeIntervalBetweenNowAndFormateTime:(NSString *)time;

/*
 *  计算传入时间戳的时间间隔（返回格式化时间）
 *
 *  @param formate   如 yyyy-MM-dd HH-mm-ss
 *
 */
+ (NSTimeInterval)secondBetweenStartTime:(NSString *)startTime
                            endTime:(NSString *)endTime;

+ (BOOL)isTimeInOneDayWithStartTime:(NSString *)startTime
                            endTime:(NSString *)endTime;

@end
