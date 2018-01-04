//
//  BaseTabbarItemContainer.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbarItemContainer.h"
#import "BaseTabbar.h"
#import "BaseTabBarItemContentView.h"

@implementation BaseTabbarItemContainer

- (instancetype)initWithTarget:(NSObject *)target tag:(NSInteger)tag {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.tag = tag;
        [self addTarget:target action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:target action:@selector(highlightAction:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:target action:@selector(highlightAction:) forControlEvents:UIControlEventTouchDragEnter];
        [self addTarget:target action:@selector(dehilightedAction:) forControlEvents:UIControlEventTouchDragExit];
        self.backgroundColor = [UIColor clearColor];
        self.isAccessibilityElement = true;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[BaseTabBarItemContentView class]]) {
            BaseTabBarItemContentView *contentView = (BaseTabBarItemContentView *)subview;
            contentView.frame = CGRectMake(contentView.insets.left,
                                           contentView.insets.top,
                                           self.width - contentView.insets.left - contentView.insets.right,
                                           self.height - contentView.insets.top - contentView.insets.bottom);
            [contentView setupLayouts];
        }
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isInside = [super pointInside:point withEvent:event];
    if (!isInside) {
        for (UIView *subview in self.subviews) {
            if ([subview pointInside:CGPointMake(point.x - subview.x, point.y - subview.y) withEvent:event]) {
                isInside = true;
            }
        }
    }
    return isInside;
}

@end
