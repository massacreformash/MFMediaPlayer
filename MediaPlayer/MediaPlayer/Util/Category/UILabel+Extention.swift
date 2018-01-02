//
//  UILabel+Extention.swift
//  USchool
//
//  Created by hefanghui on 2017/9/18.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//

import UIKit

extension UILabel {
    class func label(title: String, titleColor: UIColor, titleFontSize: CGFloat) -> UILabel {
        let label = UILabel.init()
        label.text = title
        label.textColor = titleColor
        label.font = UIFont.systemFont(ofSize: titleFontSize)
        label.sizeToFit()
        return label
    }
}
