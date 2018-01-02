//
//  UIButton+Extention.swift
//  USchool
//
//  Created by hefanghui on 2017/9/14.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//
//  Main function:UIButton便利构造初始化方法
//
//  Other specifications:
//
//  ************************************************************************

import UIKit

extension UIButton {
    class func button(title: String, titleColor: UIColor, titleFontSize: CGFloat) -> UIButton {
        let button : UIButton = UIButton.init()
        if titleFontSize > 0 {
            button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize)
        }
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.sizeToFit()
        return button
    }
    
}
