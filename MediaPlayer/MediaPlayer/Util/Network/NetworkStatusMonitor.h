//
//  NetworkStatusMonitor.h
//  StudentLive
//
//  Created by hefanghui on 2017/9/30.
//  Copyright © 2017年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HQEnum.h"
@class NetworkStatusMonitor;

@protocol NetworkStatusMonitorDelegate <NSObject>

- (void)networkStatusMonitorOldStatus:(NetworkStatus)oldStatus
                        currentStatus:(NetworkStatus)currentStatus;

@end

@interface NetworkStatusMonitor : NSObject

@property (nonatomic, assign) NetworkStatus networkStatus;
@property (nonatomic, weak) id<NetworkStatusMonitorDelegate> delegate;

+ (instancetype)shared;

@end
