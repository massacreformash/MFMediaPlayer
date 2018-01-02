//
//  NetWorkingManager.m
//  USchool
//
//  Created by hanyutong on 16/7/5.
//  Copyright © 2016年 topglobaledu. All rights reserved.
//

#import "NetWorkingManager.h"
#import "AFNetworking.h"
#import "NetWorkingManager.h"
#import "NSString+Encrypt.h"
#import "NSString+URLEncoding.h"
#import "NetworkService.h"
#import "SystemConfig.h"

NSString *disConnectionNetworkNotifation = @"disConnectionNetworkNotifation";

NSString *connectingInWifiNetworkNotifation = @"connectingInWifiNetworkNotifation";

NSString * connectingIPhoneNetworkNotifation = @"connectingIPhoneNetworkNotifation";

#define UrlUploadImage @"common/image/v1.0.0/upload"

@interface NetWorkingManager()

// 当前网络状态
@property (nonatomic, assign) NetworkStatus internetStatus;

@property (nonatomic, copy) NSString *http_uri;

@end

@implementation NetWorkingManager

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] init];
//        HQLog(@"______%@",BASE_URL);
        [self p_configSecurityPolicyIfNeeded];
        AFJSONRequestSerializer *requset = [AFJSONRequestSerializer serializer];
        [requset setTimeoutInterval:kRequestTimeOutDuration];
        _manager.requestSerializer = requset;
        _manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                              @"application/json",
                                                              @"text/json",
                                                              @"text/javascript",
                                                              @"text/plain",
                                                              @"text/html", nil];
    }
    return _manager;
}

- (instancetype)initWithNetworkStatusListening {
    self = [super init];
    if (self) {
        [self listenNetworkState];
    }
    return self;
}

- (void)p_configSecurityPolicyIfNeeded {
    if (SecurityPolicyOpenSSLMode) {
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [securityPolicy setValidatesDomainName:YES];
        _manager.securityPolicy = securityPolicy;
    }
}

+ (instancetype)netWorkingManager {
    NetWorkingManager *netWorkingManager = [[NetWorkingManager alloc] init];
    [netWorkingManager manager];
    return netWorkingManager;
}

+ (instancetype)netWorkingManagerWithNetworkStatusListening {
    NetWorkingManager *netWorkingManager = [[NetWorkingManager alloc] initWithNetworkStatusListening];
    [netWorkingManager manager];
    return netWorkingManager;
}

//保存cookies
- (void)saveCookies {
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject:
                           [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: @"sessionCookies"];
    [defaults synchronize];
}

// 加载cookies
- (void)loadCookies {
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:
                        [[NSUserDefaults standardUserDefaults] objectForKey: @"sessionCookies"]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in cookies) {
        [cookieStorage setCookie: cookie];
    }
}

- (void)setHeader {
    [NetworkService setHeaderWith:self.manager.requestSerializer
                              uri:self.http_uri];
}

- (NSURLSessionDataTask* )POST:(NSString*)URLString
                    withParams:(NSDictionary *)params
                       success:(void(^)(NSDictionary *dict))successBlock
                          fail:(void(^)(NSError *error))failerrorBlock
                          body:(BodyBlock)bodyBlock
                         cache:(BOOL)cache {
    self.http_uri = [self p_getHttpURIFromURL:URLString];
    [self setHeader];
    cache = false;
    
    NSURLSessionDataTask *task =
    [self.manager POST:URLString
            parameters:params
constructingBodyWithBlock:bodyBlock
              progress:^(NSProgress * _Nonnull uploadProgress) {}
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         if ([responseObject[@"errcode"] isEqualToString:@"40002"]) {
             [HQCustomToast showDialog:responseObject[@"errmsg"] time:1];
         }
         [self saveCookies];
         successBlock(responseObject);
     }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {failerrorBlock(error);}
     
     ];
    return  task;
}

- (NSURLSessionDataTask* )POST:(NSString*)URLString
                    withParams:(NSDictionary *)params
                       success:(void(^)(NSDictionary *dict))successBlock
                          fail:(void(^)(NSError *error))failerrorBlock
                         cache:(BOOL)cache {
    self.http_uri = [self p_getHttpURIFromURL:URLString];
    [self setHeader];
    cache = false;
    NSDictionary *dict = [self dictionaryToJson:params];
    
    NSURLSessionDataTask *task = [self.manager POST:URLString
                                         parameters:dict
                          constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                              
                              [self saveCookies];
                              if (dict != nil ) {
                                  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                                                     options:0
                                                                                       error:nil];
                                  NSString *string = [[NSString alloc] initWithData:jsonData
                                                                           encoding:NSUTF8StringEncoding];
                                  NSData *data =  [string dataUsingEncoding:NSUTF8StringEncoding];
                                  [formData appendPartWithHeaders:nil body:[NSData dataWithData:data]];
                                  
                              }
                              [formData appendPartWithHeaders:nil body:[NSData new]];
                              
                          } progress:^(NSProgress * _Nonnull uploadProgress) {
                              
                          } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                              [self saveCookies];
                              successBlock(responseObject);
                              
                          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                              failerrorBlock(error);
                              HQLog(@"neterror%@", error);
                              
                          }];
    return  task;
}

- (NSURLSessionDataTask*)GET:(NSString*)URLString
                  withParams:(NSDictionary*)params
                     success:(void(^)(NSDictionary *dict))successBlock
                        fail:(void(^)(NSError *error))failerrorBlock
                       cache:(BOOL)cache {
    self.http_uri = [self p_getHttpURIFromURL:URLString];
    [self setHeader];
    URLString = [self normalizedURL:URLString WithQueryString:params];
    return [self.manager GET:URLString
                  parameters:nil
                    progress:^(NSProgress * _Nonnull downloadProgress) {
                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        [self saveCookies];
                        successBlock(responseObject);
                        //       HQLog(@"result:%@",responseObject);
                        if ([responseObject[@"errcode"] isEqualToString:@"40002"]) {
                            [HQCustomToast showDialog:responseObject[@"errmsg"] time:1];
                        }
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        failerrorBlock(error);
                    }];
}

- (void)uploadImage:(UIImage *)image success:(SuccessBlock)success
            failure:(FailureBlock)failure {
    self.http_uri = UrlUploadImage;
    [self setHeader];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    
    if (data.length > 1024 * 1024) {
        CGFloat quatily = (1024 * 1024) / (float)data.length;
        quatily = quatily > 0.5 ? quatily : 0.5;
        data =  UIImageJPEGRepresentation(image, quatily);
        //        HQLog(@"quatily %f datalength %tuKB",quatily,(data.length / 1024) );
    }
    
    [self.manager POST:UrlUploadImage parameters:nil
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    [formData appendPartWithFileData:data
                                name:@"file"
                            fileName:@"uploadImage_iOS.jpg"
                            mimeType:@"image/jpeg"];
} progress:^(NSProgress * _Nonnull uploadProgress) {
    //        HQLog(@"uploadProgress%@",uploadProgress);
} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        HQLog(@"uploadProgress%@",responseObject);
    success(responseObject);
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    HQLog(@"error%@",error);
    failure(error);
}];
}

#pragma mark - Tool
//字典转json格式字符串：
- (NSDictionary *)dictionaryToJson:(NSDictionary *)dic {
    if (!dic) {
        return nil;
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:0
                                                         error:&parseError];
    NSString *string = [[NSString alloc] initWithData:jsonData
                                             encoding:NSUTF8StringEncoding];
    NSDictionary *mydict = @{@"body":string};
    return mydict;
}

- (NSString *)normalizedURL:(NSString *)URL WithQueryString:(NSDictionary *)parameters {
    NSString *queryString = [self normalizedRequestParameters:parameters];
    if (queryString != nil && queryString.length > 0) {
        URL = [NSString stringWithFormat:@"%@?%@",URL,queryString];
    }
    return URL;
}

- (NSString *)normalizedRequestParameters:(NSDictionary *)parameters {
    if (parameters == nil) {
        return nil;
    }
    NSMutableArray *parametersArray = [NSMutableArray array];
    for (NSString *key in parameters) {
        NSString *value = [parameters valueForKey:key];
        [parametersArray addObject:[NSString stringWithFormat:@"%@=%@",
                                    key,
                                    [value isKindOfClass:[NSString class]]?[value URLEncodedString]:value]];
    }
    return [parametersArray componentsJoinedByString:@"&"];
}

- (void)listenNetworkState {
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                HQLog(@"未知网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                self.internetStatus = NotReachable;
                [[NSNotificationCenter defaultCenter] postNotificationName:disConnectionNetworkNotifation
                                                                    object:nil];
                HQLog(@"没有网络(断网)");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                HQLog(@"手机自带网络");
                [self postNetworkInPhoneNet:ReachableVia3G oldStatus:self.internetStatus];
                //                [self postNovicationWith:ReachableVia3G];
                
                self.internetStatus = ReachableVia3G;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [self postNetworkInWifi:ReachableViaWiFi oldStatus:self.internetStatus];
                //                [self postNovicationWith:ReachableViaWiFi];
                self.internetStatus = ReachableViaWiFi;
                HQLog(@"WIFI");
                break;
        }
    }];
    // 3.开始监控
    [mgr startMonitoring];
}

- (void)postNetworkInPhoneNet:(NetworkStatus)status
                    oldStatus:(NetworkStatus)oldStatus {
    if ( ReachableVia3G == oldStatus) {
        return;
    }
    self.internetStatus = status;
    [[NSNotificationCenter defaultCenter] postNotificationName:connectingIPhoneNetworkNotifation
                                                        object:nil];;
}

- (void)postNetworkInWifi:(NetworkStatus)status oldStatus:(NetworkStatus)oldStatus{
    if ( ReachableViaWiFi == oldStatus) {
        return;
    }
    self.internetStatus = status;
    [[NSNotificationCenter defaultCenter] postNotificationName:connectingInWifiNetworkNotifation
                                                        object:nil];;
}

- (NSString *)p_getHttpURIFromURL:(NSString *)URLStr {
    NSURL *baseUrl = [NSURL URLWithString:self.baseURL];
    NSString *URI = [URLStr stringByReplacingOccurrencesOfString:[baseUrl absoluteString]
                                                      withString:@""];
    if ([URI containsString:@"?"]) {
        NSRange range = [URI rangeOfString:@"?"];
        URI = [URI substringToIndex:range.location];
    }
    URI = [NSString stringWithFormat:@"/%@",URI];
    return URI;
}

@end
