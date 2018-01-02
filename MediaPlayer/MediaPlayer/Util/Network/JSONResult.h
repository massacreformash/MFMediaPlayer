//
//  JSONResult.h
//  USchool
//
//  Created by hanyutong on 16/7/7.
//  Copyright © 2016年 topglobaledu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONResult : NSObject<NSCoding>

@property (nonatomic,strong) NSString *errcode;
@property (nonatomic,strong) NSString *errmsg;
@property (nonatomic,strong) NSString *errtime;
@property (nonatomic, strong) id data;

-(instancetype)initWithDic:(NSDictionary*)dic;
+(instancetype)resultWithNetworkErr:(NSError*)err;

@end
