//
//  ListModel.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/11.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

struct ListModel: Codable {
    
    var code: TStrInt
    var data: listData?
    var message: String
    
    struct listData: Codable {
        var pages : TStrInt
        var list: [lists]?
    }

    struct lists: Codable {
        
        var comment: String
        var created_at: String
        var end_time: String
        var number: String
        var id: TStrInt
        var person_audio: String
        
        var reply_comment: String
        var reply_person: String
        var reply_state: TStrInt
        var see_state: TStrInt
        var start_time: String
        var status: TStrInt
        var student: TStrInt
        var type: TStrInt
        var updated_at: String
        
    }
    
    
}
