//
//  TableViewCell.swift
//  unit_ui_test_inventory_app
//
//  Created by Beyza Karadeniz on 13.09.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var vendorName: UILabel!
    @IBOutlet var inventory: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
