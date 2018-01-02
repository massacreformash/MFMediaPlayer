//
//  NotificationName.h
//  StudentLive
//
//  Created by hefanghui on 2017/7/26.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#ifndef NotificationName_h
#define NotificationName_h

#define HQDefaultCenter [NSNotificationCenter defaultCenter] 

#define kPaymentCallbackNotification @"kPaymentCallbackNotification"
#define kOrderPaymentPushNotification @"kOrderPaymentPushNotification"

#define kLiveVideoProgressControllStateBegan @"kLiveVideoProgressControllStateBegan"
#define kLiveVideoProgressControllStateCancelledEnded @"kLiveVideoProgressControllStateCancelledEnded"
#define kLiveVideoProgressControllViewDidChangeOrientation @"kLiveVideoProgressControllViewDidChangeOrientation"
#define kLiveVideoControllerViewDidDisappear @"kLiveVideoControllerViewDidDisappear"

#define kCourseListNeedRefresh @"kCourseListNeedRefresh"

#define kNotificationUpdatePushID @"kNotificationUpdatePushID" // 更新推送ID
#define kRootViewControllerDidChange @"kRootViewControllerDidChange" // 根控制器发生改变

#define kNotificationLogoutReresh @"kNotificationLogoutReresh"             //退出登录刷新UI
#define kNotificationLoginSuccessReresh @"kNotificationLoginSuccessReresh" //登录成功刷新UI
#define kNotifationDisConnectionNetwork @"kNotifationDisConnectionNetwork"  // 断开网络
#define kNotifationConnectingInWifiNetwork @"kNotifationConnectingInWifiNetwork"    // 连接WIFI
#define kNotifationConnectingiPhoneNetwork @"kNotifationConnectingiPhoneNetwork"    // 连接蜂窝

#define kNotifationNetworkDidPermision @"kNotifationNetworkDidPermision"    // 允许2G/3G/4G网络下载
#define kNotifationNetworkDidForbiden @"kNotifationNetworkDidForbiden"    // 不允许2G/3G/4G网络下载

#endif /* NotificationName_h */
