//
//  AnalysisModel.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/8.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import ObjectMapper

struct AnalysisModel: Mappable {
    var city:String!
    var creator:ThreeCreatorModel!
    
    mutating func mapping(map: Map) {
        city <- map["city"]
        creator <- map["creator"]
    }
    
    init?(map: Map) {
        
    }
}

struct ThreeCreatorModel: Mappable {
    var nick:String!
    var portrait:String!
    
    mutating func mapping(map: Map) {
        nick <- map["nick"]
        portrait <- map["portrait"]
    }
    
    init?(map: Map) {
        
    }
    
}
