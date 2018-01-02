//
//  UtilitiesColor.h
//  StudentLive
//
//  Created by tianyu on 16/7/6.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UtilitiesColor : NSObject

+ (UIColor *)colorWithHexString:(NSString *)colorString;

+ (UIColor *)colorWithHexString:(NSString *)colorString withAlpha:(CGFloat)alpha;

@end
