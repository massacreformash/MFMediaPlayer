//
//  UIButton+BackgroundColor.swift
//  USchool
//
//  Created by 龚昕炜 on 2017/9/15.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(backgroundColor: UIColor, state: UIControlState) {
        self.setBackgroundImage(UIButton.p_imageWithColor(color: backgroundColor), for: state)
    }
    
    private class func p_imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
