//
//  Manager.h
//  USchool
//
//  Created by hanyutong on 16/7/7.
//  Copyright © 2016年 topglobaledu. All rights reserved.
//

#ifndef Manager_h
#define Manager_h

#import "NetWorkingManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#define NETWORK_MANAGER [NetWorkingManager netWorkingManager]


// 检查当前有没有网络
#define isConnectingNetwork   [NetWorkingManager sharedNetWorkingManager].internetStatus != NotReachable
#define  isDisConnectedNetwork [NetWorkingManager sharedNetWorkingManager].internetStatus == NotReachable
// 从无网到有网的宏接受通知
#define receiveConnectingNotifation(target, selectorName)   [[NSNotificationCenter defaultCenter] addObserver:target selector:@selector(selectorName) name:connectingNetworkNotifation object:nil]

#endif /* Manager_h */
