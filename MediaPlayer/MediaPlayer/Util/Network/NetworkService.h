//
//  NetworkService.h
//  StudentLive
//
//  Created by hanyutong on 2017/8/3.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkService : NSObject

+ (void)setHeaderWith:(AFHTTPRequestSerializer *)afHTTPRequestSerializer
                  uri:(NSString *)uri;

@end
