//
//  NetWorkingManager.h
//  USchool
//
//  Created by hanyutong on 16/7/5.
//  Copyright © 2016年 topglobaledu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "JSONResult.h"

extern NSString *disConnectionNetworkNotifation;
extern NSString *connectingInWifiNetworkNotifation;
extern NSString *connectingIPhoneNetworkNotifation;
static NSInteger kRequestTimeOutDuration = 10;

#define VID @"1"
#define MOCK @"0"

@class JSONResult;

@interface NetWorkingManager : NSObject

@property (strong,nonatomic) AFHTTPSessionManager* manager;
@property (copy, nonatomic)  NSString *CIDStr;
@property (assign, nonatomic) BOOL isLogin;
@property (copy, nonatomic) NSString *SIDStr;
@property (nonatomic, readonly) NetworkStatus internetStatus;
@property (nonatomic,copy) NSString *baseURL;

typedef void (^MutipleResult)(BOOL isSuccess, NSString *errmsg);
typedef void (^SuccessBlock)(id responseObject);
typedef void (^BodyBlock)(id<AFMultipartFormData> formData);
typedef void (^FailureBlock)(id object);
//typedef void (^SuccessBlock)(id responseObject);

+ (instancetype)netWorkingManager;
+ (instancetype)netWorkingManagerWithNetworkStatusListening;

//- (NSURLSessionDataTask* )POST:(NSString*)URLString
//                    withParams:(NSDictionary *)params
//                       success:(void(^)(NSDictionary *dict))successBlock
//                          fail:(void(^)(NSError *error))failerrorBlock
//                         cache:(BOOL)cache;

- (NSURLSessionDataTask*)GET:(NSString*)URLString
                  withParams:(NSDictionary*)params
                     success:(void(^)(NSDictionary *dict))successBlock
                        fail:(void(^)(NSError *error))failerrorBlock cache:(BOOL)cache;

- (NSURLSessionDataTask* )POST:(NSString*)URLString
                    withParams:(NSDictionary *)params
                       success:(void(^)(NSDictionary *dict))successBlock
                          fail:(void(^)(NSError *error))failerrorBlock
                          body:(BodyBlock)bodyBlock
                         cache:(BOOL)cache;
// TODO:后端目前接口不可用
- (void)uploadImage:(UIImage *)image success:(SuccessBlock)success failure:(FailureBlock)failure;

//- (void)getNetWorkEnvironment;

@end
