//
//  TaskEntity.swift
//  vg
//
//  Created by Zry on 2017/12/4.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import Foundation
class Task{
    var dev_time : String?
    var address : String?
    var create_time : String?
    var update_time : String?
    var mobile : String?
    var del_status : Int?
    var type : String?
    var user_id : Int?
    var price : String?
    var nick_name : String?
    var name : String?
    var header : String?
    var id : Int?
    var desc : String?
    init(dict: [String: AnyObject]) {
        dev_time = dict["dev_time"] as? String
        address = dict["address"] as? String
        create_time = dict["create_time"] as? String
        update_time = dict["update_time"] as? String
        mobile = dict["mobile"] as? String
        del_status = dict["del_status"] as? Int
        type = dict["type"] as? String
        user_id = dict["user_id"] as? Int
        price = dict["price"] as? String
        nick_name = dict["nick_name"] as? String
        name = dict["name"] as? String
        header = dict["header"] as? String
        id = dict["id"] as? Int
        desc = dict["desc"] as? String
  
    }
}
