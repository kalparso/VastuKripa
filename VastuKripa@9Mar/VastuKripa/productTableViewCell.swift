//
//  productTableViewCell.swift
//  VastuKripa
//
//  Created by Promatics on 1/6/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class productTableViewCell: UITableViewCell {

    @IBOutlet weak var addToCart_btn: UIButton!
    
    @IBOutlet weak var line_View: UIView!
    @IBOutlet weak var product_Buy: UIButton!
    @IBOutlet weak var product_name: UILabel!
    @IBOutlet weak var product_desc: UILabel!
    @IBOutlet weak var product_price: UILabel!
    @IBOutlet weak var product_img: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
