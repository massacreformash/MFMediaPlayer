//  ************************************************************************
//
//  MJDIYHeader.m
//  StudentLive
//
//  Created by 宋永建 on 2017/7/29.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:  DIY 刷新
//
//  Other specifications:
//
//  ************************************************************************

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MJDIYHeader.h"
#import "HQLoadingAnimationView.h"
#import "UIImage+GIF.h"
#import "NSString+Size.h"

static CGFloat kMJDIYHeaderHeight = 67;
static CGFloat kMJDIYHeaderImageHeight = 59;
static CGFloat kMJDIYHeaderImageWidth = 84;

@interface MJDIYHeader()

@property (weak, nonatomic) UILabel *statusLabel;
@property (nonatomic, strong) UILabel *studyTitleLabel;
@property (nonatomic, strong) HQLoadingAnimationView *loadingAnimationView;
@property (nonatomic, strong) UIImageView *gifview;

@property (nonatomic, assign) BOOL canChange;

@end

@implementation MJDIYHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare {
    [super prepare];
    // 设置控件的高度
    self.mj_h = kMJDIYHeaderHeight;
    
    [self p_setupStatusLabel];
    [self p_setupStudyTitleLabel];
    [self p_setupGifImage];
}

- (void)p_setupGifImage {
    UIImageView *gifview = [self imageViewimageView];
    [self addSubview:gifview];
    self.gifview = gifview;
}

- (UIImageView *)imageViewimageView {
    UIImage *image = [self gifImage];
    UIImageView *gifview = [[UIImageView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width) * 0.5 - 60, 25,25,25)];
    gifview.image = image;
    return gifview;
}
- (UIImage *)nomailImage {
    return [UIImage imageNamed:@"sl_mj_refresh_diy_png"];
}

- (UIImage *)gifImage {
    return [UIImage sd_animatedGIFNamed:@"sl_mj_refresh_diy"];
}

- (void)p_setupStatusLabel {
    UILabel *statusLabel = [[UILabel alloc] init];
    statusLabel.textColor = kColorC3_6;
    statusLabel.font = [UIFont systemFontOfSize:T10_20PX];
    statusLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:statusLabel];
    self.statusLabel = statusLabel;
}

- (void)p_setupStudyTitleLabel {
    UILabel *studyTitleLabel = [[UILabel alloc] init];
    studyTitleLabel.text = @"让学习更美好";
    studyTitleLabel.textColor = kColorC3_5;
    studyTitleLabel.font = [UIFont boldSystemFontOfSize:T8_24PX];
    studyTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:studyTitleLabel];
    self.studyTitleLabel = studyTitleLabel;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews {
    [super placeSubviews];
    self.studyTitleLabel.frame = CGRectMake([self p_labelX], 20, 100, 14);
    self.statusLabel.frame = CGRectMake([self p_labelX] , CGRectGetMaxY(self.studyTitleLabel.frame) + 6, 100, 14);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
    CGPoint newPoint = [change[@"new"] CGPointValue];
//    CGPoint oldPoint = [change[@"old"] CGPointValue];
    
    CGFloat newPointY = newPoint.y * (-1);
//    CGFloat oldPointY = oldPoint.y * (-1);
    if (newPointY > 67) {
        self.canChange = NO;
    } else {
        self.canChange = YES;
    }
    
    if (newPointY > 0 && newPointY < 67 &&  self.canChange) {
        
        CGFloat width = (newPointY / kMJDIYHeaderHeight) * kMJDIYHeaderImageWidth;
        CGFloat height = (newPointY / kMJDIYHeaderHeight) * kMJDIYHeaderImageHeight;
        
        self.gifview.size = CGSizeMake(width, height);
        self.gifview.center = CGPointMake([self p_gifImageCenterX],
                                          kMJDIYHeaderHeight - (height * 0.5 + 4) );
    }
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change {
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change {
    [super scrollViewPanStateDidChange:change];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            //            [self.loadingAnimationView startAnimating];
            self.statusLabel.text = @"下拉可以刷新";
            self.gifview.image = [self nomailImage];
            break;
        case MJRefreshStatePulling:
            //            [self.loadingAnimationView startAnimating];
            self.statusLabel.text = @"松开立即刷新";
            self.gifview.image = [self gifImage];
            break;
        case MJRefreshStateRefreshing:
            self.statusLabel.text = @"正在刷新数据中……";
            //            [self.loadingAnimationView startAnimating];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
}

- (CGFloat)p_labelX {
    return (HQScreenW - kMJDIYHeaderImageWidth - [self p_studyTitleLabelWidth]) * 0.5 +
    kMJDIYHeaderImageWidth;
}

- (CGFloat)p_gifImageCenterX {
    return (HQScreenW - kMJDIYHeaderImageWidth - [self p_studyTitleLabelWidth]) * 0.5 +
            kMJDIYHeaderImageWidth * 0.5;
}

- (CGFloat)p_studyTitleLabelWidth {
    return [NSString sizeForString:@"让学习更美好" fontSize:T8_24PX].width;
}
@end

