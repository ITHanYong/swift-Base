//
//  CollectionViewModel.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CollectionViewModel: NSObject {

    var subject:String?     //科目
    var score:String?       //分数
    
    static func initWithData(dict:NSDictionary) -> CollectionViewModel {
        
        return CollectionViewModel.init().initWithDict(dict:dict)
    }
    
    func initWithDict(dict:NSDictionary) -> CollectionViewModel {
        
        subject = dict["lesson_name"] as? String
        score = String(format: "%d分 / 排名%d", (dict["score"] as? NSInteger)!, (dict["score_order"] as? NSInteger)!)
        
        return self
    }
    
}
