//
//  TaskListViewController.swift
//  vg
//
//  Created by Zry on 2017/11/18.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit
import MJRefresh
import Kingfisher
class TaskListViewController: UITableViewController {
    @IBOutlet weak var btn_search: UIBarButtonItem!
    var pageNumber : Int?
     var pageSize: Int?
    var taskList = [Task]()
    //顶部刷新
    let header=MJRefreshNormalHeader()
    //底部刷新
    let footer=MJRefreshAutoNormalFooter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = themeFont
        self.navigationController?.navigationBar.barTintColor = themeColor
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        btn_search.action = #selector(search)
        btn_search.target = self
        //btn_search.add(self, action: #selector(search), for:.touchUpInside)
//        //设置分割线颜色
//
        //下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.tableView.mj_header = header
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        self.tableView.mj_footer = footer
        initData()
        
    }
    @objc func search(){
        let destinationStoryboard = UIStoryboard(name:"Main",bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "SearchScene") as UIViewController
        self.present(destinationViewController, animated: true, completion: nil)
    
    }
    private func initData(){
        pageNumber = 1
        pageSize = 10
        NetWork.getTasks(pageNumber: pageNumber!, pageSize: pageSize!) { (result) in
            if(result.resultStatus!){
                self.taskList = result.data as! [Task]
                self.tableView.reloadData()
                
            }
        }
    }
    //顶部刷新
    @objc open func headerRefresh(){
      
        //结束刷新
        self.tableView.mj_header.endRefreshing();
    }

    //底部刷新
    var index = 0
    @objc open func footerRefresh(){
        print("上拉刷新")
        self.tableView.mj_footer.endRefreshing()
        index = index + 1
        if(index > 2){
            footer.endRefreshingWithNoMoreData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "task_cell", for: indexPath) as! TaskViewCell
        let task = self.taskList[indexPath.row]
        cell.create_time.text = task.create_time
        cell.area.text = task.address
        cell.desc.text = task.desc
        cell.title.text = task.name
        cell.money.text = task.price
        cell.time.text = task.dev_time
        if(task.del_status==0){
        }
        let type : Int
        type = Int(task.type!)!
        if((type)%2 != 0){
        if(type==1){
            cell.dakehu.setTitle("大客户", for:.normal)
        }
        if(type==3){
            cell.dakehu.setTitle("精品", for:.normal)
        }
        if(type==5){
            cell.dakehu.setTitle("加急", for:.normal)
            }
            cell.jingping.isHidden =  true
            cell.jiaji.isHidden = true
        }
        if((type)%2 == 0){
        if(type==4){
            cell.dakehu.titleLabel?.text = "大客户"
            cell.jingping.titleLabel?.text = "精品"
        }
        if(type==6){
            cell.dakehu.titleLabel?.text = "大客户"
            cell.jingping.titleLabel?.text = "加急"
        }
        if(type==8){
            cell.dakehu.titleLabel?.text = "精品"
            cell.jingping.titleLabel?.text = "加急"
        }
            cell.jiaji.isHidden = true
        }
        if(type==9){
            cell.dakehu.titleLabel?.text = "大客户"
            cell.jingping.titleLabel?.text = "精品"
            cell.jiaji.titleLabel?.text = "加急"
        }
        cell.header.layer.cornerRadius = cell.header.frame.width/2
        cell.header.clipsToBounds = true
        cell.header.layer.shadowOpacity = 0.8
        cell.header.layer.shadowColor = UIColor.black.cgColor
        let headerUrl = "http://localhost:8010/image/20171129/e5f4a124a65b4859ab92ae035b500a42.jpg"
        let url = URL(string: headerUrl)
        cell.header.kf.setImage(with:url)
        cell.header.layer.shadowOffset = CGSize(width:1,height:1);
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
