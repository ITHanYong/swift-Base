//
//  UITextField+ Extension.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    
    //MARK:-设置暂位文字的颜色
    var placeholderColor:UIColor {
        
        get{
            let color =   self.value(forKeyPath: "_placeholderLabel.textColor")
            if color == nil {
                return UIColor.white;
            }
            return color as! UIColor;
        }
        
        set{
            self.setValue(newValue, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    
    //MARK:-设置暂位文字的字体
    var placeholderFont:UIFont{
        get{
            let font =   self.value(forKeyPath: "_placeholderLabel.font")
            if font == nil {
                return UIFont.systemFont(ofSize: 14);
            }
            return font as! UIFont;
        }
        
        set{
            self.setValue(newValue, forKeyPath: "_placeholderLabel.font")
        }
    }
}

