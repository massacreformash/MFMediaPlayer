//
//  Common.swift
//  USchool
//
//  Created by hefanghui on 2017/9/15.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//

// MARK:自定义Log
func HQLog<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd  HH:mm:ss.SSS"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        let fileName = (file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
        print("\(strNowTime) - [\(fileName) \(function)] [line \(lineNumber)]- \(message)")
    #endif
}

// MARK:文件目录
let kPathDocuments = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
func kPathDocument(_ file: String) -> String {
    return (kPathDocuments?.appending(file))!
}

// MARK:屏幕参数
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
let kScreenBounds = UIScreen.main.bounds
let kKeyWindow = UIApplication.shared.keyWindow

// MARK:屏幕比例系数
let kScaleW = (kScreenW / 375.0)
let kScaleH = (kScreenH / 667.0)
let kScreenScale = UIScreen.main.scale

func kAdapedWidth(_ width: CGFloat) -> CGFloat {
    if kIsiPhone6Plus || kIsiPhone6PlusBigMode {
        return width * kScaleW
    }
    return width
}

func kAdapedHeight(_ height: CGFloat) -> CGFloat {
    if kIsiPhone6Plus || kIsiPhone6PlusBigMode {
        return height * kScaleH
    }
    return height
}

func kAdapediPhoneAndiPad(_ iPhone : CGFloat, _ iPad : CGFloat) -> CGFloat {
    if UIDevice.isAiPad() {
        return iPad
    } else {
        return iPhone
    }
}

func kAdapediPhoneAndiPad(_ iPhone : String, _ iPad : String) -> String {
    if UIDevice.isAiPad() {
        return iPad
    } else {
        return iPhone
    }
}

// MARK:网络是否可达
func isConnectingNetwork() -> Bool {
    let reachable: Bool = NetworkStatusMonitor.shared().networkStatus != NetworkStatus.init(0)
    return reachable
}


// MARK:常用控件参数
let kHeightNavBar = CGFloat(64.0)
let kHeightTabBar = CGFloat(49.0)
let kMarginCommon = CGFloat(15.0)
let kHeightSysStatusBar = CGFloat(20.0)
let kHeightHotSpotStatusBar = CGFloat(20.0)

// MARK:设备类型
let kIsiPhone5 = UIDevice.isiPhone5()
let kIsiPhone6 = UIDevice.isiPhone6()
let kIsiPhone6Plus = UIDevice.isiPhone6Plus()
let kIsiPhone6PlusBigMode = UIDevice.isiPhone6PlusBigMode()
let kIsiPhoneX = UIDevice.isiPhoneX()

// MARK:系统类型
let kIsiOS11 = UIDevice.isiOS11()
let kIsiOS10 = UIDevice.isiOS10()
let kIsiOS9 = UIDevice.isiOS9()
let kIsiOS8 = UIDevice.isiOS8()

// 判断是否为iPad
let kIsIpad = UIDevice.isAiPad()
