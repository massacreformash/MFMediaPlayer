//
// Created by Maxiao on 15/09/2017.
// Copyright (c) 2017 topglobaledu. All rights reserved.
//

import Foundation

public func RGBColor(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat) -> UIColor { return RGBColor(r, g, b, 1.0)}
public func RGBColor(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat, _ a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

let KColorLine = RGBColor(237,237,237)
let kColorBackGround = RGBColor(245,246,247)
let KColorBlack = RGBColor(0,0,0)

let kColorC1_1  = RGBColor(255,128,35)
let kColorC1_2 = RGBColor(240,118,29)

let kColorC2_1 = RGBColor(250,151,39)
let kColorC2_2 = RGBColor(250,201,71)
let kColorC2_3 = RGBColor(197,144,105)
let kColorC2_4 = RGBColor(255,133,133)
let kColorC2_5 = RGBColor(124,219,90)

let kColorC3_1 = RGBColor(124,219,90)
let kColorC3_2 = RGBColor(58,58,58)
let kColorC3_3 = RGBColor(80,80,80)
let kColorC3_4 = RGBColor(119,119,119)
let kColorC3_5 = RGBColor(156,156,156)
let kColorC3_6 = RGBColor(187,187,187)
let kColorC3_7 = RGBColor(204,204,204)

let kColorC4_1 = RGBColor(255,255,255)
let kColorC4_2 = RGBColor(245,246,247)
let kColorC4_3 = RGBColor(250,250,250)
let kColorC4_4 = RGBColor(237,237,237)
let kColorC4_5 = RGBColor(220,220,220)
let kColorC4_6 = RGBColor(240,240,240)


// kRGBColorFromHex(rgbValue: 0xE0E0E0)
func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
    
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                   alpha: 1.0)
}
