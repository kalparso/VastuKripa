//
//  userTableViewCell.swift
//  VastuKripa
//
//  Created by promatics on 12/17/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class userTableViewCell: UITableViewCell {

    @IBOutlet weak var user_img: UIImageView!
    
    @IBOutlet weak var userName_lbl: UILabel!
    
    @IBOutlet weak var userImg_btn: UIButton!
    @IBOutlet weak var logo_img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
