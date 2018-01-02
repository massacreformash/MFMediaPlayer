//
//  UIView+CornerRadius.h
//  StudentLive
//
//  Created by hefanghui on 2017/3/1.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CornerType) {
    CornerTypeTopLeft,
    CornerTypeTopRight,
    CornerTypeBottomLeft,
    CornerTypeBottomRight,
    CornerTypeAll
};

@interface UIView (CornerRadius)

- (void)setCornerSize:(CGSize)size rectCornerType:(UIRectCorner)type;
- (void)setCornerRadius:(CGFloat)radius rectCornerType:(UIRectCorner)type;

@end
