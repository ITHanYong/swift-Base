//
//  NSDate+EC.swift
//  JSON
//
//  Created by Mac on 2019/3/5.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    // MARK: 年
    func year() -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year], from: self)
        return components.year!
    }
    
    
}
