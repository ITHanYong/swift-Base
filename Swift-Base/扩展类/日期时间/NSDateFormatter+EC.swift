//
//  NSDateFormatter+EC.swift
//  JSON
//
//  Created by Mac on 2019/3/5.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

enum ECDateFormaterMode {
    
    /**默认 年-月-日 时:分:秒 */
    case none
    
    /** 年-月-日 */
    case day
    
    /** 年\*月\*日 */
    case day1
    
    /** 年-月-日 时:分 */
    case minute
    
    /** 年-月-日 时:分:秒 */
    case second
}

enum ECTimeFormaterMode {
    
    /**默认 年-月-日 时:分:秒 */
    case none
    
    /** 时:分 */
    case minute
    
    /** 时:分:秒 */
    case second
}

extension DateFormatter {
    
    class func dateFormaterWithMode(formaterMode:ECDateFormaterMode) -> DateFormatter {
        
        var stringFormat: String?
        
        switch formaterMode {
            
        case .day:
            stringFormat = "yyyy-MM-dd"
            break
            
        case .day1:
            stringFormat = "yyyy年MM月dd日"
            break
            
        case .minute:
            stringFormat = "yyyy-MM-dd HH:mm"
            break
            
        case .second:
            stringFormat = "yyyy-MM-dd HH:mm:ss"
            break
            
        default:
            stringFormat = "yyyy-MM-dd HH:mm:ss"
            break
        }
        
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = stringFormat
       
        return dateFormat
    }
    
    func timeFormaterWithMode(formaterMode:ECTimeFormaterMode) -> DateFormatter {
        
        var stringFormat: String?
        
        switch formaterMode {
            
        case .minute:
            stringFormat = "HH:mm"
            break
            
        case .second:
            
            stringFormat = "HH:mm:ss"
            break
            
        default:
            stringFormat = "HH:mm:ss"
            break
            
        }
        
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = stringFormat
        
        return dateFormat
    }
    
}
