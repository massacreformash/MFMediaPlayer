//
//  HQToast.h
//  StudentLive
//
//  Created by 宋永建 on 2017/7/29.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQToast : UIView

+ (void)showDialog:(NSString *)content;
+ (void)showDialog:(NSString *)content inView:(UIView *)view;
+ (void)showNetworkError;
+ (void)showDialog:(NSString *)content inView:(UIView *)view WithTime:(CGFloat)seconds;

@end
