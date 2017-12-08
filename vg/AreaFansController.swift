//
//  AreaFansController.swift
//  vg
//
//  Created by Zry on 2017/11/14.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit
class AreaFansController: UITableViewController {
var areas = ["闵行区莘庄镇","兰州七里河区","三明市尤溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧都区","成都武侯区","汕头市金平区","长沙市芙蓉区"]
    var areaImages = ["xinzhuang", "qilihe", "youxi", "chengxi", "baiyun", "shangjie", "nangang", "yaodu", "wuhou", "jinping", "furong"]
    var provinces = ["上海", "甘肃", "福建", "青海", "广东", "福建", "黑龙江", "山西", "四川", "广东", "湖南"]
    var parts = ["华东", "西北", "东南", "西北", "华南", "东南", "东北", "华北", "西南", "华南", "华中"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomerTableViewCell
        cell.diqu.text = areas[indexPath.row]
        cell.quyu.text = parts[indexPath.row]
        cell.shen.text = provinces[indexPath.row]
        cell.tupian.image = UIImage(named:areaImages[indexPath.row])
        // Configure the cell...
        cell.tupian.layer.cornerRadius = cell.tupian.frame.width/2
        cell.tupian.clipsToBounds = true
        cell.tupian.layer.shadowOpacity = 0.8
        cell.tupian.layer.shadowColor = UIColor.black.cgColor
        cell.tupian.layer.shadowOffset = CGSize(width:1,height:1)
        return cell
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let top = UIContextualAction(style: .normal, title: ""){ (_,_, finish) in
            
        }
        let bottom = UIContextualAction(style: .normal, title: ""){ (_,_, finish) in
            
        }
        // shareButton.backgroundColor = UIColor(named: "theme")
        let config = UISwipeActionsConfiguration(actions: [top,bottom])
        return config
        
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delAction = UIContextualAction(style: .destructive, title: "删除") {(_,_, finish) in
            tableView.deleteRows(at: [indexPath], with: .automatic)
            finish(true)
         }
        let shareButton = UIContextualAction(style: .normal, title: "分享") {(_,_, finish) in
            let text = "快来"+self.areas[indexPath.row]+"玩吧"
            let image = UIImage(named:self.areaImages[indexPath.row])!
            let ac = UIActivityViewController(activityItems: [text,image], applicationActivities: nil)
            self.present(ac, animated: true, completion: nil)
            finish(true)
        }
        shareButton.backgroundColor = UIColor(named: "theme")
        let config = UISwipeActionsConfiguration(actions: [delAction,shareButton])
        return config
    }
    

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
