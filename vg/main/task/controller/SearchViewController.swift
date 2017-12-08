//
//  SearchViewController.swift
//  vg
//
//  Created by Zry on 2017/12/7.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIActionSheetDelegate {
    @IBOutlet weak var navigation_bar: UINavigationBar!
    
    @IBOutlet weak var btn_type: UIButton!
    @IBOutlet weak var search_content: UITextField!
    @IBOutlet weak var view_list: UITableView!
    @IBOutlet weak var bren_return: UIBarButtonItem!
    @IBOutlet weak var btn_search: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation_bar.titleTextAttributes = themeFont
        navigation_bar.barTintColor = themeColor
        view_list.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        bren_return.target =  self
        bren_return.action = #selector(returnBack)
        btn_type.addTarget(self, action: #selector(getType), for: .touchUpInside)
        btn_search.addTarget(self, action: #selector(searchFunc), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func searchFunc(){
       


    }
    
    @objc func getType(){
        let alertController=UIAlertController(title: "搜索类型", message: "请选择搜索类型", preferredStyle: .alert)
        let action1 =  UIAlertAction(title: "任务名称", style: .default, handler:{
            action in
            self.search_content.text = ""
            self.search_content.placeholder = "任务名称"
        })
        let action2 =  UIAlertAction(title: "任务类型", style: .default, handler:{
            aciton in
            self.search_content.text = ""
            self.search_content.placeholder = "任务类型"

        })
        let action3 =  UIAlertAction(title: "任务地点", style: .cancel, handler: {
            action in
            self.search_content.text = ""
            self.search_content.placeholder = "任务地点"

        })
        let action4 =  UIAlertAction(title: "取消", style: .default, handler: nil)
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        alertController.addAction(action4)
        self.present(alertController, animated: true, completion: nil)
    }
  
    
    @objc func returnBack() {
        self.dismiss(animated: true, completion: nil)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
