//
//  UIView+Frmae.swift
//  USchool
//
//  Created by hefanghui on 2017/9/14.
//  Copyright © 2017年 topglobaledu. All rights reserved.
//
//  Main function:UIView计算frame的分类
//
//  Other specifications:
//
//  ************************************************************************

import UIKit

extension UIView {
    
    // MARK: 拓展基本属性
    public var x: CGFloat {
        set {
            var frame = self.frame;
            frame.origin.x = newValue;
            self.frame = frame;
        }
        get {
            return self.frame.origin.x;
        }
    }
    
    public var y: CGFloat {
        set {
            var frame = self.frame;
            frame.origin.y = newValue;
            self.frame = frame;
        }
        get {
            return self.frame.origin.y;
        }
    }
    
    public var width: CGFloat {
        set {
            var frame = self.frame;
            frame.size.width = newValue;
            self.frame = frame;
        }
        get {
            return self.frame.size.width;
        }
    }
    
    public var height: CGFloat {
        set {
            var frame = self.frame;
            frame.size.height = newValue;
            self.frame = frame;
        }
        get {
            return self.frame.size.height;
        }
    }
    
    public var right: CGFloat {
        set {
            var frame = self.frame;
            frame.origin.x = (newValue - self.frame.size.width);
            self.frame = frame;
        }
        get {
            return (self.frame.origin.x + self.frame.size.width);
        }
    }
    
    public var bottom: CGFloat {
        set {
            var frame = self.frame;
            frame.origin.y = (newValue - self.frame.size.height);
            self.frame = frame;
        }
        get {
            return (self.frame.origin.y + self.frame.size.height);
        }
    }
    
    public var centerX: CGFloat {
        set {
            var center = self.center;
            center.x = newValue;
            self.center = center;
        }
        get {
            return self.center.x;
        }
    }
    
    public var centerY: CGFloat {
        set {
            var center = self.center;
            center.y = newValue;
            self.center = center;
        }
        get {
            return self.center.y;
        }
    }
    
    public var origin: CGPoint {
        set {
            let newFrame = CGRect.init(x: newValue.x,
                                       y: newValue.y,
                                       width: self.frame.size.width,
                                       height: self.frame.size.height)
            self.frame = newFrame;
        }
        get {
            return self.frame.origin;
        }
    }
    
    public var size: CGSize {
        set {
            let newFrame = CGRect.init(x: self.frame.origin.x,
                                       y: self.frame.origin.y,
                                       width: newValue.width,
                                       height: newValue.height)
            self.frame = newFrame;
        }
        get {
            return self.frame.size;
        }
    }
    
    // MARK: 属性坐标转换
    public func frameInView(view: UIView) -> CGRect {
        let frame = self.convert(self.bounds, to: view)
        return frame
    }
    
    public func xInView(view: UIView) -> CGFloat {
        let frame = self.convert(self.bounds, to: view)
        return frame.origin.x;
    }
    
    public func yInView(view: UIView) -> CGFloat {
        let frame = self.convert(self.bounds, to: view)
        return frame.origin.y;
    }
    
    public func rightInView(view: UIView) -> CGFloat {
        let frame = self.convert(self.bounds, to: view)
        return (frame.origin.x + frame.size.width)
    }
    
    public func bottomInView(view: UIView) -> CGFloat {
        let frame = self.convert(self.bounds, to: view)
        return (frame.origin.y + frame.size.height)
    }
    
    public func centerXInView(view: UIView) -> CGFloat {
        let frame = self.convert(self.bounds, to: view)
        return (frame.origin.x + frame.size.width * 0.5)
    }
    
    public func centerYInView(view: UIView) -> CGFloat {
        let frame = self.convert(self.bounds, to: view)
        return (frame.origin.y + frame.size.height * 0.5)
    }
}
