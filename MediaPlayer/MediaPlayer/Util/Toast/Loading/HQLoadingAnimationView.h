//
//  HQLoadingAnimationView.h
//  StudentLive
//
//  Created by 宋永建 on 2017/7/29.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQLoadingAnimationView : UIView

- (id)initWithTintColor:(UIColor *)tintColor;
- (id)initWithTintColor:(UIColor *)tintColor size:(CGFloat)size;

- (void)startAnimating;
- (void)stopAnimating;

@end
