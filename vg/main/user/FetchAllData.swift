//
//  FetchAllData.swift
//  vg
//
//  Created by Zry on 2017/12/1.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FetchAllData: NSObject,NSFetchedResultsControllerDelegate{
    override init() {
        
    }
    var fc: NSFetchedResultsController<CustomerMO>!
    
func fetchAllCustomerData() -> [CustomerMO]{
    var customerMo: [CustomerMO]
    customerMo = []
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.managedObjectContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
    do{
        customerMo = try context.fetch(fetchRequest) as! [CustomerMO]
    }catch {
        print(error)
    }
    return customerMo
}
    
    func fetchCurrentToken()-> String?{
        return fetchAllCustomerData()[0].token;
    }
}
