//
//  Common.h
//  MediaPlayer
//
//  Created by Aaron Peng on 2018/1/2.
//  Copyright © 2018年 BUPT. All rights reserved.
//

#if DEBUG
#define HQLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define HQLog(...)
#endif

#define HQLogFileStr(object) [NSString stringWithFormat:@"%@%s [Line %d] %@\n",[HQLogFile curretTime], \
__PRETTY_FUNCTION__, \
__LINE__, \
object]
#define HQPushLogFile(object) [HQLogFile wirtePushLog:HQLogFileStr(object)]

// 判断是否为iPad
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark - iPhone屏幕
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6PlusBigMode ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define ParameterFor(iPhoneParam ,iPadParam) (!isiPad ? iPhoneParam : iPadParam)

// 横屏
#define isLandscape (isLandscapeLeft || isLandscapeRight)
#define isLandscapeLeft ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft)
#define isLandscapeRight ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight)

#pragma mark - IOS版本
/** 获取IOS版本号并转换为float类型  7.0  8.0 */
#define STDIosVersion ([[UIDevice currentDevice].systemVersion floatValue])
#define iOS9 ([[UIDevice currentDevice].systemVersion floatValue]>=9.0 ? YES:NO)
#define iOS8 ([[UIDevice currentDevice].systemVersion floatValue]>=8.0 ? YES:NO)
#define BeyondiOS8_3 ([[UIDevice currentDevice].systemVersion floatValue]>8.3 ? YES:NO)
#define iOS10 ([[UIDevice currentDevice].systemVersion floatValue]>=10.0 ? YES:NO)
#define iOS11 ([[UIDevice currentDevice].systemVersion floatValue]>=11.0 ? YES:NO)

// weakSelf
#define __weakSelf  __weak typeof(self) weakSelf = self
#define weakSelf weakSelf

#define HQKeyWindow [UIApplication sharedApplication].keyWindow
#define HQScreenW [UIScreen mainScreen].bounds.size.width
#define HQScreenH [UIScreen mainScreen].bounds.size.height
#define HQScreenBounds [UIScreen mainScreen].bounds

#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]

#pragma mark - 程序及沙盒目录 数据存储
/**沙盒下目录*/
#define HQSandBoxPath             NSHomeDirectory()
//Documents目录: 保存应用程序自己的数据会备份这个目录下的数据
#define HQPathDocuments            [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define HQPathDocument(file)      [HQPathDocuments stringByAppendingPathComponent:file]
#define HQPathCaches               [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define HQPatqhCache(file)      [HQPathCaches stringByAppendingPathComponent:file];
// Tmp 目录: 存储一些其他临时数据 手机重启删除
#define HQPathTmp            [HQSandBoxPath stringByAppendingPathComponent:@"tmp"]
#define HQPathTmps(file)      [HQPathTmp stringByAppendingPathComponent:file]

// 偏好设置的单例对象 Preference目录 iTunes、iCloud 备份时会备份这个目录下的数据
#define HQPathUserDefaults         [NSUserDefaults standardUserDefaults]

#pragma mark - 图片比例的宏
#define SCALE_WIDTH (isiPad ? SCALE_WIDTH_IPAD : SCALE_WIDTH_IPHONE)
#define SCALE_HEIGHT (isiPad ? SCALE_HEIGHT_IPAD : SCALE_HEIGHT_IPHONE)
#define SCALE_WIDTH_IPHONE (HQScreenW / 375.0)
#define SCALE_HEIGHT_IPHONE (HQScreenH / 667.0)
#define SCALE_WIDTH_IPAD (HQScreenW / 768.0)
#define SCALE_HEIGHT_IPAD (HQScreenH / 1024.0)
#define iPhoneSCALEWIDTH(width)  (iPhone6 ?  width : (width * (HQScreenW / 375)) )
#define iPhoneSCALEHEIGHT(height)  (iPhone6 ? height : (height * (HQScreenH / 667)))
#define iPhone5SCALEWIDTH(width) (iPhone5 ? (width * (HQScreenW / 375)) : width)
#define iPhone5SCALEHEIGHT(height) (iPhone5 ? (height * (HQScreenH / 667)) : height)
#define kAdapedWidth(width) ((iPhone6Plus || iPhone6PlusBigMode) ? (width * (HQScreenW / 375)) : width)
#define kAdapedHeight(height) ((iPhone6Plus || iPhone6PlusBigMode) ? (height * (HQScreenH / 667)) : height)

//一个像素的线的宏
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)
#define SCREEN_SCALE [UIScreen mainScreen].scale

// 高度宏定义

#define NAVBAR_HEIGHT 64
#define TABBAR_HEIGHT 49

// 通用间距
#define MARGIN_COMMON kAdapedHeight(15.0)

// 标准系统状态栏高度
#define SYS_STATUSBAR_HEIGHT  20
// 热点栏高度
#define HOTSPOT_STATUSBAR_HEIGHT  20
