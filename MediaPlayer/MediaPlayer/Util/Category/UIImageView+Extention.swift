//
//  UIImageView+Extention.swift
//  USchool
//
//  Created by hefanghui on 2017/9/14.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//
//  Main function:UIImageView便利构造初始化方法
//
//  Other specifications:
//
//  ************************************************************************

import UIKit

extension UIImageView {
    class func imageView(imageName: String) -> UIImageView {
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: imageName));
        return imageView;
    }
    
    class func imageView(color: UIColor) -> UIImageView {
        let imageView: UIImageView = UIImageView.init();
        imageView.image = self.p_imageWithColor(color: color)
        return imageView;
    }
    
    private class func p_imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        
        return image;
    }
}
