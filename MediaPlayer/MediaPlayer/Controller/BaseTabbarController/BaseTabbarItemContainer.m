//
//  BaseTabbarItemContainer.m
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import "BaseTabbarItemContainer.h"

@implementation BaseTabbarItemContainer

- (instancetype)initWithTarget:(NSObject *)target tag:(NSInteger)tag {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.tag = tag;
//        [self addTarget:target action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>];
    }
    return self;
}

@end
