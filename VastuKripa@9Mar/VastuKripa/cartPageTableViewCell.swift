//
//  cartPageTableViewCell.swift
//  
//
//  Created by promatics on 2/15/16.
//
//

import UIKit

class cartPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quantity_btn: UILabel!
    @IBOutlet weak var product_name_lbl: UILabel!
    
    @IBOutlet weak var product_price_lbl: UILabel!
    
    @IBOutlet weak var product_quantity_lbl: UILabel!
    
    @IBOutlet weak var product_imageView: UIImageView!
    
    @IBOutlet weak var quantityBtn: UIButton!

    @IBOutlet weak var trashBtn: UIButton!
    
    @IBOutlet weak var line_view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
