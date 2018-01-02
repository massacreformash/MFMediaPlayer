//
//  UIButton+TimeInterval.m
//  StudentLive
//
//  Created by hefanghui on 2017/7/28.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:事件响应间隔分类
//
//  Other specifications:
//
//  ************************************************************************

#import "UIButton+TimeInterval.h"
#import <objc/message.h>

const char *repeatEventIntervalKey  = "repeatEventIntervalKey";
const char *previousClickTimeKey = "previousClickTimeKey";

@interface UIButton ()

@property NSTimeInterval previousClickTime;

@end

@implementation UIButton (TimeInterval)

+ (void)load {
    Method sendAction = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method hq_SendAction = class_getInstanceMethod([self class], @selector(hq_SendAction:to:forEvent:));
    
    method_exchangeImplementations(sendAction, hq_SendAction);
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
}

- (void)setRepeatEventInterval:(NSTimeInterval)repeatEventInterval {
    objc_setAssociatedObject(self, repeatEventIntervalKey, @(repeatEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)repeatEventInterval {
    NSTimeInterval repeatEventIn = (NSTimeInterval)[objc_getAssociatedObject(self, repeatEventIntervalKey) doubleValue];
    if (repeatEventIn >= 0) {
        return repeatEventIn;
    }
    return 0.0;
}

- (void)setPreviousClickTime:(NSTimeInterval)previousClickTime {
    objc_setAssociatedObject(self, previousClickTimeKey, @(previousClickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)previousClickTime {
    NSTimeInterval previousEventTime = [objc_getAssociatedObject(self, previousClickTimeKey) doubleValue];
    if (previousEventTime != 0) {
        return previousEventTime;
    }
    return 1.0;
}

- (void)hq_SendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSTimeInterval time = [[[NSDate alloc] init] timeIntervalSince1970];
    NSTimeInterval previousEventTime = [self previousClickTime];
    NSTimeInterval repeatEventInterval = [self repeatEventInterval];
    if (time - previousEventTime < repeatEventInterval) {
        return;
    }
    if (self.repeatEventInterval > 0) {
        self.previousClickTime = [[[NSDate alloc] init] timeIntervalSince1970];
    }
    [self hq_SendAction:action to:target forEvent:event];
}

@end
