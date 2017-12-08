//
//  TaskViewCell.swift
//  vg
//
//  Created by Zry on 2017/12/1.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var jiaji: UIButton!
    
    @IBOutlet weak var jingping: UIButton!
    
    @IBOutlet weak var dakehu: UIButton!
    
    @IBOutlet weak var desc: UILabel!
  
    @IBOutlet weak var area: UILabel!
    
    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var money: UILabel!
    
    @IBOutlet weak var create_time: UILabel!
    
    @IBOutlet weak var status: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
