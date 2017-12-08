//
//  Customer.swift
//  vg
//
//  Created by Zry on 2017/11/16.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import Foundation
import UIKit
class User{
    var id: Int?
    var nick_name: String?
    var mobile: String?
    var password: String?
    var header: String?
    var desc: String?
    var gender: Int?
    var del_status: Int?
    var create_time: String?
    var update_time: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        nick_name = dict["nick_name"] as? String
        mobile = dict["mobile"] as? String
        password = dict["password"] as? String
        header = dict["header"] as? String
        desc = dict["desc"] as? String
        gender = dict["gender"] as? Int
        del_status = dict["del_status"] as? Int
        create_time = dict["create_time"] as? String
        update_time = dict["update_time"] as? String
    }
}
class ResultModel{
    var code: Int?
    var resultStatus: Bool?
    var resultStr: String?
    var data: AnyObject
    init(dict: [String: AnyObject]) {
        code=dict["code"] as? Int
        resultStatus=dict["resultStatus"] as? Bool
        resultStr=dict["resultStr"] as? String
        data=dict["data"] as AnyObject
       
    }
}
