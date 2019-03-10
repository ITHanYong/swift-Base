//
//  UIColor+Extension.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/27.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func colorWithHex(rgb:Int) -> UIColor {
        return self.colorWithHexAlpha(rgb: rgb, alpha: 1.0)
    }
    
    static func colorWithHexAlpha(rgb:Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgb & 0xFF)) / 255.0, alpha: alpha)
    }
    
    static func UIColorFromRGB(rgb : String) -> UIColor {
        return self.UIColorFromRGBAlpha(rgb: rgb, alpha: 1.0)
    }
    
    static func UIColorFromRGBAlpha(rgb : String , alpha : CGFloat) -> UIColor {
        
        if rgb.isEmpty {
            return UIColor.clear
        }
        
        var cString = rgb.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if cString.count == 0 {
            return UIColor.clear
        }
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count < 6 && cString.count != 6 {
            
            return UIColor.clear
        }
        
        let value = "0x\(cString)"
        
        let scanner = Scanner(string:value)
        
        var hexValue : UInt64 = 0
        //查找16进制是否存在
        if scanner.scanHexInt64(&hexValue) {
            
            let redValue = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
            let greenValue = CGFloat((hexValue & 0xFF00) >> 8)/255.0
            let blueValue = CGFloat(hexValue & 0xFF)/255.0
            return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
        }else{
            return UIColor.clear
        }
    }
}
