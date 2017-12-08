//
//  NetWork.swift
//  vg
//
//  Created by Zry on 2017/11/16.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD
import CoreData

protocol NetWorkProtocol {
    static func login(mobile:String,password:String,completionHandler:@escaping (_ resultModel:ResultModel)->())
    
    static func register(mobile:String,password:String,messageCode:String,completionHandler:@escaping((ResultModel)->()))
    
    static func resetPassWord(mobile:String,password:String,messageCode:String,completionHandler:@escaping((ResultModel)->()))
    static func releaseTask(task:String,userId:Int64,completionHandler:@escaping((ResultModel)->()))
    
    static func getTasks(pageNumber:Int,pageSize:Int,completionHandler:@escaping((ResultModel)->()))
    static func searchConentByType(type:String,content:String,completionHandler:@escaping((ResultModel)->()))
}
class NetWork: NetWorkProtocol{
    static func searchConentByType(type: String, content: String, completionHandler: @escaping ((ResultModel) -> ())) {
        var url = BASE_SEARCH_URL
        var isTask : Bool = false
        
        if(type.contains("Company")){
            url = url + "getCompanyByType"
        }else{
            isTask = true
            url = url + "getTaskyByType"
        }
        let params=["type": type,"content":content]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON{
            (response) in guard response.result.isSuccess else{
                return
            }
            if let value = response.result.value
            {
                let json = JSON(value)
                let dataList = json["data"].array
                var mDataList : [AnyObject]
                if(isTask){
                    mDataList = [Task]()
                    for task in dataList!{
                        let mTask = Task.init(dict: task.dictionaryObject! as [String : AnyObject])
                        mDataList.append(mTask)                    }
                }else{
//                    mDataList = [Cmpany]()
//                    for task in dataList!{
//                        let mTask = Task.init(dict: task.dictionaryObject! as [String : AnyObject])
//                        mDataList.append(mTask)
                }
            }
        }
    }
    
    static func getTasks(pageNumber: Int, pageSize: Int, completionHandler: @escaping ((ResultModel) -> ())) {
        let url = BASE_TASK_URL+"getTasks"
        let params=["pageNumber": pageNumber,"pageSize": pageSize];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON{
            (response) in guard response.result.isSuccess else{
                return
            }
            if let value = response.result.value
            {
                let json = JSON(value)
                let taskList = json["data"].array
                var mTaskList : [Task]
                mTaskList = [Task]()
                for task in taskList!{
                    let mTask = Task.init(dict: task.dictionaryObject! as [String : AnyObject])
                    mTaskList.append(mTask)
                }
                guard let data = json.dictionaryObject else{
                    return
                }
                let resultStatus = (data["resultStatus"] != nil) as Bool
                var mResultModel:ResultModel
                mResultModel = ResultModel.init(dict: data as [String : AnyObject])
                mResultModel.resultStatus = resultStatus
                mResultModel.data = mTaskList as AnyObject
                completionHandler(mResultModel)
            }
        }
    }
  
    static func releaseTask(task: String, userId: Int64, completionHandler: @escaping ((ResultModel) -> ())) {
        let url = BASE_TASK_URL+"releaseTask"
        let params = ["task":task,"userId":userId] as [String : Any];
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON{
            (response) in guard response.result.isSuccess else{
                return
            }
            if let value = response.result.value
            {
             let json = JSON(value)
                guard let data = json.dictionaryObject else{
                    return
                }
                let resultStatus = (data["resultStatus"] != nil) as Bool
                var mResultModel:ResultModel
                mResultModel = ResultModel.init(dict: data as [String : AnyObject])
                mResultModel.resultStatus = resultStatus
                completionHandler(mResultModel)
            }
        }
    }
    
    
    static func resetPassWord(mobile: String, password: String, messageCode: String, completionHandler: @escaping ((ResultModel) -> ())) {
        let url = BASE_CUSTOMER_URL+"resetPassword"
        let params=["mobile": mobile,"password": password];
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON{
            (response) in guard response.result.isSuccess else{
                return
            }
            if let value=response.result.value
            {
                let json = JSON(value)
                guard let data = json.dictionaryObject else{
                    return
                }
                let resultStatus = (data["resultStatus"] != nil) as Bool
                var mResultModel:ResultModel
                mResultModel = ResultModel.init(dict: data as [String : AnyObject])
                mResultModel.resultStatus = resultStatus
                completionHandler(mResultModel)
            }
        }
    }
    
    static func register(mobile: String, password: String, messageCode: String, completionHandler: @escaping ((ResultModel) -> ())) {
        let url = BASE_CUSTOMER_URL+"register"
        let params=["mobile": mobile,"password": password];
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON{
            (response) in guard response.result.isSuccess else{
                return
            }
            if let value=response.result.value
            {
                let json = JSON(value)
                guard let data = json.dictionaryObject else{
                    return
                }
                let resultStatus = (data["resultStatus"] != nil) as Bool
                var mResultModel:ResultModel
                mResultModel = ResultModel.init(dict: data as [String : AnyObject])
                mResultModel.resultStatus = resultStatus
                completionHandler(mResultModel)
            }
        }
    }
 
  
    
static func login(mobile:String,password:String,completionHandler:@escaping (_ resultModel:ResultModel)->()){
    let url=BASE_CUSTOMER_URL+"login";
    let params=["mobile": mobile,"password": password];
    Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default , headers: nil).responseJSON{
        (response) in guard response.result.isSuccess else{
            return
        }
        if let value = response.result.value
        {
        let json = JSON(value)
            guard let data = json.dictionaryObject else{
                return
            }
            let resultStatus = (data["resultStatus"] != nil) as Bool
            let password = json["data"]["data"]["password"].string
            let update_time = json["data"]["data"]["update_time"].string
            let gender = json["data"]["data"]["gender"].int16
            let nick_name = json["data"]["data"]["nick_name"].string
            let id = json["data"]["data"]["id"].int64
            let desc = json["data"]["data"]["desc"].string
            let token = json["data"]["token"].string
            let appDel = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.managedObjectContext
            let customer=NSEntityDescription.insertNewObject(forEntityName: "Customer", into: context) as! CustomerMO
            customer.desc = desc
            customer.nick_name = nick_name
            customer.password = password
            customer.update_time = update_time
            customer.id = id!
            customer.token = token
            customer.gender = gender!
            do {
                try context.save()
                print("保存成功")
            }catch let error{
                print("context can't save!, Error:\(error)")
            }
            var mResultModel:ResultModel
            mResultModel = ResultModel.init(dict: data as [String : AnyObject])
            mResultModel.resultStatus = resultStatus
            completionHandler(mResultModel)
    
        }
    }
   
}

}
