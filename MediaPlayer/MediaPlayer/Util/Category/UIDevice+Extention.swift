//
//  UIDevice+Extention.swift
//  USchool
//
//  Created by hefanghui on 2017/9/15.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//
//  Main function:设备类型属性拓展类
//
//  Other specifications:设备类型、系统版本号
//
//  ************************************************************************

@objc extension UIDevice {
    
    @objc public class func isiPhoneX() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width: 1125, height: 2436)))! {
            return true
        }
        return false
    }
    
    public class func isiPhone6PlusBigMode() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width: 1125, height: 2001)))! {
            return true
        }
        return false
    }
    
    public class func isiPhone6Plus() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width:1242, height: 2208)))! {
            return true
        }
        return false
    }
    
    public class func isiPhone6() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width:750, height: 1334)))! {
            return true
        }
        return false
    }
    
    public class func isiPhone5() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width: 640, height: 1136)))! {
            return true
        }
        return false
    }
    
    public class func isiOS11() -> Bool {
        if #available(iOS 11.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS10() -> Bool {
        if #available(iOS 10.0, *) {
            return true
        } else {
            return false
        }        
    }
    
    public class func isiOS9() -> Bool {
        if #available(iOS 9.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS8() -> Bool {
        if #available(iOS 8.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isAiPad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return true
        }
        return false
    }
}
