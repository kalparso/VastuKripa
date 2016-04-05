//
//  menuTableViewCell.swift
//  VastuKripa
//
//  Created by promatics on 12/17/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class menuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuName_lbl: UILabel!
    
    @IBOutlet weak var icon_img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
