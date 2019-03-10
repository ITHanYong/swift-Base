//
//  UIImage+Extension.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/27.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

import UIKit

extension UIImage {
    
    // MARK: 根据颜色创建图片
    static func imageWithColor(color:UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
