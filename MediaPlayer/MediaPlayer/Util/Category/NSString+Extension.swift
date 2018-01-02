//
//  NSString+Extension.swift
//  USchool
//
//  Created by 龚昕炜 on 2019/8/15.
//  Copyright © 2019年 topglobaledu. All rights reserved.
//

import UIKit

extension NSString {
    
    // 文本的size相关
    class func heightForString(value: NSString?, fontSize: CGFloat, width: CGFloat) -> CGFloat {
        if (value == nil) {
            return 0
        }
        let allRange = value?.range(of: value! as String)
        let attrStr = NSMutableAttributedString.init(string: value! as String)
        attrStr.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fontSize), range: allRange!)
        let rect = value?.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return (rect?.size.height)!
    }
    
    class func heightForString(value: NSString?, fontSize: CGFloat, width: CGFloat, lineSpacing: CGFloat) -> CGFloat {
        return self.heightForString(value: value, fontSize: fontSize, width: width, lineSpacing: lineSpacing, lineCount: -1)
    }
    
    class func heightForString(value: NSString?, fontSize: CGFloat, width: CGFloat, lineSpacing: CGFloat, lineCount: NSInteger) -> CGFloat {
        if (!(value?.neitherNilNorEmpty())!) {
            return 0
        }
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpacing
        let attrs: [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.systemFont(ofSize: fontSize),
                                                    NSAttributedStringKey.paragraphStyle: paragraphStyle,
                                                    NSAttributedStringKey.baselineOffset: (0)]
        let rect = value?.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
        let aSpaceString = NSString.init(string:"")
        let singleLineRect = aSpaceString.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
        if ((rect?.size.height)! <= singleLineRect.size.height) {
            return NSString.heightForString(value: value, fontSize: fontSize, width: width)
        }
        if ((rect?.size.height)! / singleLineRect.size.height >= CGFloat(lineCount) && lineCount > 0) {
            return CGFloat(lineCount) * singleLineRect.size.height
        }
        return (rect?.size.height)!
    }
    
    class func isSingeLineWithString(value: NSString?, fontSize: CGFloat, width: CGFloat, lineSpacing: CGFloat) -> Bool {
        if (value == nil) {
            return false
        }
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpacing
        let attrs:[NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.systemFont(ofSize: fontSize),
                                                   NSAttributedStringKey.paragraphStyle: paragraphStyle,
                                                   NSAttributedStringKey.baselineOffset: (0)]
        let rect = value?.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
        let aSpaceString = NSString.init(string:"")
        let singleLineRect = aSpaceString.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil)
        if ((rect?.size.height)! <= singleLineRect.size.height) {
            return true
        }
        return false
    }
    
    class func sizeForString(value: NSString?, fontSize: CGFloat) -> CGSize {
        if (value == nil) {
            return CGSize.zero
        }
        let allRange = value?.range(of: value! as String)
        let attrStr = NSMutableAttributedString.init(string: value! as String)
        attrStr.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fontSize), range: allRange!)
        let rect = value?.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return (rect?.size)!
    }
    
    //    class func dateStringFromTimeStamp(timeStampStr: NSString, format: NSString) -> NSString {
    //        if (!(timeStampStr.neitherNilNorEmpty())) {
    //            return ""
    //        }
    //        let date = NSDate.init(timeIntervalSince1970: timeStampStr.doubleValue)
    //        let formatter = DateFormatter.init()
    //        formatter.dateFormat = format as String!
    //        return formatter.string(from: date as Date) as NSString
    //    }
    
    func resultsMatchedRegularExpression(regularExpression: NSString) -> NSArray? {
        guard let _detector = try? NSRegularExpression.init(pattern: regularExpression as String, options: NSRegularExpression.Options.caseInsensitive)
            else {
                return nil
        }
        let array = _detector.matches(in: self as String, options: NSRegularExpression.MatchingOptions.withTransparentBounds, range: NSRange.init(location: 0, length: self.length))
        let matchResultArrayM = NSMutableArray.init(capacity: array.count)
        for result in array {
            let imageUrlStr = self.substring(with: result.range)
            matchResultArrayM .add(imageUrlStr)
        }
        return matchResultArrayM.copy() as? NSArray
    }
    
    func neitherNilNorEmpty() -> Bool {
        let string = self as String
        if (!string.isEmpty) {
            return true
        }
        return false
    }
    
    func lastString() -> NSString {
        if (self.neitherNilNorEmpty() && self.length > 1) {
            let lastString = self.substring(from: self.length - 1)
            return lastString as NSString
        }
        return self
    }
    
    // 删除字符串首尾空格
    func deletePrefixAndSuffixSpacestring() -> NSString {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
    }
    
    func stringWidthFontOfSize(fontSize: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return rect.size.width
    }
    
    func stringHeightFontOfSize(fontSize: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return rect.size.height
    }
    
    /**
     *  浮点数转化为两位小数以内string
     *
     *  @param floatNumber      如 3.30
     *
     *  @return @"3.3"
     */
    class func stringFromFloatNumber(floatNumber: CGFloat) -> NSString {
        if (fmodf(Float(floatNumber), 1) == 0) {
            return NSString.init(format: "%.0f", floatNumber)
        } else if (fmodf(Float(floatNumber * 10), 1) == 0) {
            return NSString.init(format: "%.1f", floatNumber)
        } else {
            return NSString.init(format: "%.2f", floatNumber)
        }
    }
}
