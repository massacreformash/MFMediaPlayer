//
//  SystemConfig.swift
//  StudentLive
//
//  Created by hefanghui on 2017/9/23.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

import Foundation

#if DEVELOP
let kContentType = "develop"
let kBaseUrl = NSURL.init(string: "http://hqlive.develop.api.zquick.cn/")
let kH5BaseUrl = NSURL.init(string: "http://wx.develop.zquick.cn/")
let kGetuiAppID = "L47j1FyWgt6q5ieH3yAeu9"
let kGetuiAppKey = "V4JXZedtGD9Q6OKwF6dgk2"
let kGetuiAppSecret = "FJYcoY4QD29vxld0wiqrZ1"
let kCCVideoUserID = ""
#else
#if SIM
let kContentType = "sim"
let kBaseUrl = NSURL.init(string: "https://t.api.zquick.cn/")
let kH5BaseUrl = NSURL.init(string: "http://wx.sim.zquick.cn/")
let kGetuiAppID = "q198gI2MFJANSbMZ7Ao5H4"
let kGetuiAppKey = "dct4XSXeDA7OwVYj0YhK92"
let kGetuiAppSecret = "CdA6zuw6FF8cRQw9zXJrZ4"
let kCCVideoUserID = "6F5A1483F15B5528"
#else
#if FEATURE
let kContentType = "feature"
let kBaseUrl = NSURL.init(string: "http://hqlive.feature.api.zquick.cn/")
let kH5BaseUrl = NSURL.init(string: "http://hqlive.feature.api.zquick.cn/")
let kGetuiAppID = "q198gI2MFJANSbMZ7Ao5H4"
let kGetuiAppKey = "dct4XSXeDA7OwVYj0YhK92"
let kGetuiAppSecret = "CdA6zuw6FF8cRQw9zXJrZ4"
let kCCVideoUserID = ""
#else
#if ONLINE
let kContentType = "api"
let kBaseUrl = NSURL.init(string: "http://api.yk.hqyxjy.com/")
let kH5BaseUrl = NSURL.init(string: "http://wx.hqyxjy.com/")
let kGetuiAppID = "q198gI2MFJANSbMZ7Ao5H4"
let kGetuiAppKey = "dct4XSXeDA7OwVYj0YhK92"
let kGetuiAppSecret = "CdA6zuw6FF8cRQw9zXJrZ4"
let kCCVideoUserID = "D666C181628C62C9"
#else
let kContentType = "test"
let kBaseUrl = NSURL.init(string: "http://hqlive.test.api.zquick.cn/")
let kH5BaseUrl = NSURL.init(string: "http://wx.test.zquick.cn/")
let kGetuiAppID = "q198gI2MFJANSbMZ7Ao5H4"
let kGetuiAppKey = "dct4XSXeDA7OwVYj0YhK92"
let kGetuiAppSecret = "CdA6zuw6FF8cRQw9zXJrZ4"
let kCCVideoUserID = "6F5A1483F15B5528"
#endif
#endif
#endif
#endif

