//
//  BaseTabBarItemContentView.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/3.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarItemContentView : UIView

@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selecedImage;
@property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, strong) UIColor *badgeColor;

- (void)setupLayouts;
- (void)selectWithAnimation:(BOOL)animated completion:(void(^)(void))completion;
- (void)deselectWithAnimation:(BOOL)animated completion:(void(^)(void))completion;
- (void)reselectWithAnimation:(BOOL)animated completion:(void(^)(void))completion;
- (void)highlightWithAnimation:(BOOL)animated completion:(void(^)(void))completion;
- (void)dehighlightWithAnimation:(BOOL)animated completion:(void(^)(void))completion;
- (void)badgeChangedWithAnimation:(BOOL)animated completion:(void(^)(void))completion;

@end
