//
//  CQMQPhotoTableViewCell.swift
//  demoSwitf
//
//  Created by zhongchuren on 2018/7/23.
//  Copyright © 2018年 sundusk. All rights reserved.
//

import UIKit

class CQMQPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
