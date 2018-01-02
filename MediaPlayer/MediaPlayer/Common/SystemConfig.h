//
//  SystemConfig.h
//  StudentLive
//
//  Created by hefanghui on 2017/8/28.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

//http://api.hqyxjy.com:80/
//http://test.api.zquick.cn/
//http://develop.api.zquick.cn/
//http://sim.api.zquick.cn/
//http://feature.api.zquick.cn/

#ifndef SystemConfig_h
#define SystemConfig_h

#ifdef DEVELOP
#define CONTENTTYPE @"develop"
#define BASE_URL_HQLIVE [NSURL URLWithString:@"http://hqlive.develop.api.zquick.cn/"]
#define BASE_URL_MAGIC7 [NSURL URLWithString:@"http://magic7.develop.api.zquick.cn"]
#define H5_BASE_URL [NSURL URLWithString:@"http://wx.develop.zquick.cn/"]

#define GETUI_APPID @"L47j1FyWgt6q5ieH3yAeu9"
#define GETUI_APPKEY @"V4JXZedtGD9Q6OKwF6dgk2"
#define GETUI_APPSECRET @"FJYcoY4QD29vxld0wiqrZ1"

#define CC_VIDEO_USER_ID @""

#define SecurityPolicyOpenSSLMode NO
#else
#ifdef SIM
#define CONTENTTYPE @"sim"
#define BASE_URL_HQLIVE [NSURL URLWithString:@"https://t.api.zquick.cn/"]
#define BASE_URL_MAGIC7 [NSURL URLWithString:@"http://magic7.sim.api.zquick.cn"]
#define H5_BASE_URL [NSURL URLWithString:@"http://wx.sim.zquick.cn/"]

#define GETUI_APPID @"q198gI2MFJANSbMZ7Ao5H4"
#define GETUI_APPKEY @"dct4XSXeDA7OwVYj0YhK92"
#define GETUI_APPSECRET @"CdA6zuw6FF8cRQw9zXJrZ4"

#define CC_VIDEO_USER_ID @"6F5A1483F15B5528"

#define SecurityPolicyOpenSSLMode YES
#else
#ifdef FEATURE
#define CONTENTTYPE @"feature"
#define BASE_URL_HQLIVE [NSURL URLWithString:@"http://hqlive.feature.api.zquick.cn/"]
#define BASE_URL_MAGIC7 [NSURL URLWithString:@"http://magic7.feature.api.zquick.cn"]
#define H5_BASE_URL [NSURL URLWithString:@"http://hqlive.feature.api.zquick.cn/"]

#define GETUI_APPID @"q198gI2MFJANSbMZ7Ao5H4"
#define GETUI_APPKEY @"dct4XSXeDA7OwVYj0YhK92"
#define GETUI_APPSECRET @"CdA6zuw6FF8cRQw9zXJrZ4"

#define CC_VIDEO_USER_ID @""

#define SecurityPolicyOpenSSLMode NO
#else
#ifdef ONLINE
#define CONTENTTYPE @"api"
#define BASE_URL_HQLIVE [NSURL URLWithString:@"http://api.yk.hqyxjy.com/"]
#define BASE_URL_MAGIC7 [NSURL URLWithString:@"http://magic7.develop.api.zquick.cn"]
#define H5_BASE_URL [NSURL URLWithString:@"http://wx.hqyxjy.com/"]

#define GETUI_APPID @"q198gI2MFJANSbMZ7Ao5H4"
#define GETUI_APPKEY @"dct4XSXeDA7OwVYj0YhK92"
#define GETUI_APPSECRET @"CdA6zuw6FF8cRQw9zXJrZ4"

#define CC_VIDEO_USER_ID @"D666C181628C62C9"

#define SecurityPolicyOpenSSLMode NO
#else
#define CONTENTTYPE @"test"
#define BASE_URL_HQLIVE [NSURL URLWithString:@"http://hqlive.test.api.zquick.cn/"]
#define BASE_URL_MAGIC7 [NSURL URLWithString:@"http://magic7.develop.api.zquick.cn"]
#define H5_BASE_URL [NSURL URLWithString:@"http://wx.test.zquick.cn/"]

#define GETUI_APPID @"q198gI2MFJANSbMZ7Ao5H4"
#define GETUI_APPKEY @"dct4XSXeDA7OwVYj0YhK92"
#define GETUI_APPSECRET @"CdA6zuw6FF8cRQw9zXJrZ4"

#define CC_VIDEO_USER_ID @"6F5A1483F15B5528"

#define SecurityPolicyOpenSSLMode NO
#endif
#endif
#endif
#endif

#endif /* SystemConfig_h */
