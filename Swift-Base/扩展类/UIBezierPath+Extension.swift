//
//  UIBezierPath+Extension.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/28.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIBezierPath {
    /*
    圆角设置
    - Parameters:
    - view: 需要设置的控件
    - corner: 哪些圆角
    - radii: 圆角半径
    - Returns: layer图层
    */
    static func configRectCorner(view: UIView, corner: UIRectCorner, radii: CGSize) -> CALayer {
        
        let maskPath = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: corner, cornerRadii: radii)
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = view.bounds
        maskLayer.path = maskPath.cgPath
        
        return maskLayer
    }
}
