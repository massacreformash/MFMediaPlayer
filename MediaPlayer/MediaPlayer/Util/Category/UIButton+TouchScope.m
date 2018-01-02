//
//  UIButton+TouchScope.m
//  StudentLive
//
//  Created by hefanghui on 2017/8/7.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import "UIButton+TouchScope.h"
#import <objc/runtime.h>

static NSString *expandRectXKey = @"expandRectX";
static NSString *expandRectYKey = @"expandRectY";
static NSString *expandRectWidthKey = @"expandRectWidthKey";
static NSString *expandRectHeightKey = @"expandRectHeightKey";
static NSString *expandWidthMultipleKey = @"expandWidthMultipleKey";
static NSString *expandHeightMultipleKey = @"expandHeightMultipleKey";

@implementation UIButton (TouchScope)

- (void)expandTouchScopeRect:(CGRect)rect {
    objc_setAssociatedObject(self,
                             &expandRectXKey,
                             [NSNumber numberWithFloat:rect.origin.x],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandRectYKey,
                             [NSNumber numberWithFloat:rect.origin.y],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandRectWidthKey,
                             [NSNumber numberWithFloat:rect.size.width],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandRectHeightKey,
                             [NSNumber numberWithFloat:rect.size.height],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)expandTouchScopeWidthMultiple:(CGFloat)widthMultiple heightMultiple:(CGFloat)heightMultiple {
    objc_setAssociatedObject(self,
                             &expandRectXKey,
                             [NSNumber numberWithFloat:(self.size.width * (1 - widthMultiple)) / 2.0],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandRectYKey,
                             [NSNumber numberWithFloat:(self.size.height * (1 - heightMultiple)) / 2.0],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandRectWidthKey,
                             [NSNumber numberWithFloat:self.size.width * widthMultiple],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandRectHeightKey,
                             [NSNumber numberWithFloat:self.size.height * heightMultiple],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandWidthMultipleKey,
                             [NSNumber numberWithFloat:widthMultiple],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self,
                             &expandHeightMultipleKey,
                             [NSNumber numberWithFloat:heightMultiple],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)expandRect {
    NSNumber *expandRectX = objc_getAssociatedObject(self, &expandRectXKey);
    NSNumber *expandRectY = objc_getAssociatedObject(self, &expandRectYKey);
    NSNumber *expandRectWidth = objc_getAssociatedObject(self, &expandRectWidthKey);
    NSNumber *expandRectHeight = objc_getAssociatedObject(self, &expandRectHeightKey);
    
    CGFloat width = expandRectWidth.floatValue > 0 ?
                    expandRectWidth.floatValue : self.bounds.size.width;
    CGFloat height = expandRectHeight.floatValue > 0 ?
                     expandRectHeight.floatValue : self.bounds.size.height;
    return CGRectMake(self.bounds.origin.x + expandRectX.floatValue,
                      self.bounds.origin.y + expandRectY.floatValue,
                      width,
                      height);
}

- (void)hq_checkMultiplesExists {
    CGFloat expandWidthMultiple = ((NSNumber *)(objc_getAssociatedObject(self, &expandWidthMultipleKey))).floatValue;
    CGFloat expandHeightMultiple = ((NSNumber *)(objc_getAssociatedObject(self, &expandHeightMultipleKey))).floatValue;
    if (expandWidthMultiple != 0 && expandHeightMultiple != 0) {
        [self expandTouchScopeWidthMultiple:expandWidthMultiple heightMultiple:expandHeightMultiple];
    }
}

// 响应用户的点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    [self hq_checkMultiplesExists];
    CGRect buttonRect = [self expandRect];
    if (CGRectEqualToRect(buttonRect, self.bounds)) {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(buttonRect, point) ? YES : NO;
}

- (void)ShowButtonTouchScope {
    [self ShowButtonTouchScopeWithColor:[UtilitiesColor colorWithHexString:@"8600FF"]];
}

- (void)ShowButtonTouchScopeWithColor:(UIColor *)color {
#if DEBUG
    UIView *buttonTouchScopeView = [self viewWithTag:1102];
    if (buttonTouchScopeView != nil) {
        [buttonTouchScopeView removeFromSuperview];
        buttonTouchScopeView = nil;
    }
    buttonTouchScopeView = [[UIView alloc] initWithFrame:[self expandRect]];
    buttonTouchScopeView.userInteractionEnabled = NO;
    buttonTouchScopeView.tag = 1102;
    buttonTouchScopeView.backgroundColor = color;
    [self addSubview:buttonTouchScopeView];
    [self bringSubviewToFront:self.titleLabel];
    [self bringSubviewToFront:self.imageView];
#endif
}

//#pragma mark - Setter
//- (void)setShouldShowButtonTouchScope:(BOOL)shouldShowButtonTouchScope {
//#if DEBUG
//    if (shouldShowButtonTouchScope) {
//        UIView *buttonTouchScopeView = [self viewWithTag:1102];
//        if (buttonTouchScopeView != nil) {
//            [buttonTouchScopeView removeFromSuperview];
//            buttonTouchScopeView = nil;
//        }
//        buttonTouchScopeView = [[UIView alloc] initWithFrame:[self expandRect]];
//        buttonTouchScopeView.userInteractionEnabled = NO;
//        buttonTouchScopeView.tag = 1102;
//        buttonTouchScopeView.backgroundColor = [UtilitiesColor colorWithHexString:@"8600FF"];
//        [self addSubview:buttonTouchScopeView];
//        [self bringSubviewToFront:self.titleLabel];
//        [self bringSubviewToFront:self.imageView];
//    }
//#endif
//}

@end
