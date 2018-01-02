//
//  UIImageView+Extention.m
//  StudentLive
//
//  Created by hefanghui on 2017/8/4.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function:UIImageView拓展类
//
//  Other specifications:包含：根据图片名称创建实例并sizeToFit的快速构造方法
//
//  ************************************************************************

#import "UIImageView+Extention.h"

@implementation UIImageView (Extention)

+ (instancetype)imageNamed:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [imageView sizeToFit];
    return imageView;
}

@end
