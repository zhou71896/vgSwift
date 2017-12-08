//
//  CustomerTableViewCell.swift
//  vg
//
//  Created by Zry on 2017/11/14.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    @IBOutlet weak var quyu: UILabel!
    @IBOutlet weak var shen: UILabel!
    @IBOutlet weak var diqu: UILabel!
    @IBOutlet weak var tupian: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
