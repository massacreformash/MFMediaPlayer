//  ************************************************************************
//
//  NetworkService.m
//  StudentLive
//
//  Created by hanyutong on 2017/8/3.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//
//  Main function: 暂时只配置了网络请求header
//
//  Other specifications:
//
//  ************************************************************************

#import "NetworkService.h"
#import "NSString+Encrypt.h"
#import "NetWorkingManager.h"

static NSString *kNetStatus;
static NetworkService *_networkService;


@implementation NetworkService

+ (NetworkService *)shareNetworkService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _networkService = [[self alloc] init];
        [_networkService p_addObservers];
    });
    return _networkService;
}

+ (void)setHeaderWith:(AFHTTPRequestSerializer *)afHTTPRequestSerializer
                  uri:(NSString *)uri {
    NSString *time  = [self currentTimeString];
    _networkService = [NetworkService shareNetworkService];
//    [afHTTPRequestSerializer setValue:[self p_pidWithType:baseUrlType] forHTTPHeaderField:@"PID"];
//    [afHTTPRequestSerializer setValue:VID forHTTPHeaderField:@"VID"];
//    [afHTTPRequestSerializer setValue:@"ios" forHTTPHeaderField:@"PLATFORM"];
//    [afHTTPRequestSerializer setValue:@"1" forHTTPHeaderField:@"PKG_SOURCE"];
//    [afHTTPRequestSerializer setValue:@"1" forHTTPHeaderField:@"SOURCE"];
//    [afHTTPRequestSerializer setValue:[self p_UUIDString] forHTTPHeaderField:@"DEVICEID"];
//    [afHTTPRequestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
//    [afHTTPRequestSerializer setValue:[self p_CIDStringWithType:baseUrlType] forHTTPHeaderField:@"CID"];
//    [afHTTPRequestSerializer setValue:[self p_UIDStringWithType:baseUrlType] forHTTPHeaderField:@"UID"];
//    [afHTTPRequestSerializer setValue:[self p_SIDStringWithType:baseUrlType] forHTTPHeaderField:@"SID"];
//    [afHTTPRequestSerializer setValue:[self p_getPhoneInfo] forHTTPHeaderField:@"UA"];
//    [afHTTPRequestSerializer setValue:kNetStatus forHTTPHeaderField:@"NETWORK"];
    [afHTTPRequestSerializer setValue:time forHTTPHeaderField:@"TIME"];
//    [afHTTPRequestSerializer setValue:[self encryptWithUri:uri
//                                                    CIDStr:[self p_CIDStringWithType:baseUrlType]
//                                                      time:time]
//                   forHTTPHeaderField:@"TOKEN"];
//    [afHTTPRequestSerializer setValue:MOCK forHTTPHeaderField:@"MOCK"];
}

+ (NSString *)p_getPhoneInfo {
    NSString *systemVersion  = [[UIDevice currentDevice] systemVersion];//系统版本
    NSString *systemModel    = [[UIDevice currentDevice] model];//是iphone 还是 ipad
    NSDictionary *dic        = [[NSBundle mainBundle] infoDictionary];//获取info－plist
    NSString *rom            = [NSString stringWithFormat:@"%llu", [NSProcessInfo processInfo].physicalMemory];
    NSString *appVersion     = dic[@"CFBundleShortVersionString"];
    CGRect rect              = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    NSString *scale_screenStr = [NSString stringWithFormat:@"%.f * %.f", width*scale_screen, height*scale_screen];
    return [NSString stringWithFormat:@"%@;%@;%@;%@;%@",
            appVersion,
            systemVersion,
            systemModel,
            rom,
            scale_screenStr];
}

+ (NSString *)currentTimeString {
    NSDate *date = [NSDate date];
    NSString *timeStamp = [NSString stringWithFormat:@"%.0lf",[date timeIntervalSince1970]];
    return timeStamp;
}

- (void)p_addObservers {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(p_networkStatusDidChanged:)
                   name:connectingIPhoneNetworkNotifation object:nil];
    
    [center addObserver:self selector:@selector(p_networkStatusDidChanged:)
                   name:connectingInWifiNetworkNotifation object:nil];
    
    [center addObserver:self selector:@selector(p_networkStatusDidChanged:)
                   name:disConnectionNetworkNotifation object:nil];
}

- (void)p_removeObservers {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:connectingIPhoneNetworkNotifation object:nil];
    [center removeObserver:self name:connectingInWifiNetworkNotifation object:nil];
    [center removeObserver:self name:disConnectionNetworkNotifation object:nil];
}

- (void)dealloc {
    [self p_removeObservers];
}

- (void)p_networkStatusDidChanged:(NSNotification *)notifiaction {
    kNetStatus = @"unknow";
    if ([notifiaction.name isEqualToString:@"disConnectionNetworkNotifation"]) {
        kNetStatus = @"disConnectionNetwork";
    } else if ([notifiaction.name isEqualToString:@"connectingIPhoneNetworkNotifation"]) {
        kNetStatus = @"wwan";
    } else if ([notifiaction.name isEqualToString:@"connectingInWifiNetworkNotifation"]) {
        kNetStatus = @"wifi";
    }
}

@end

