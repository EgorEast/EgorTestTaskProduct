//
//  ListCell.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 09.11.2021.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var titleProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    
    
    func configure(product: Product) {
        self.titleProductLabel.text = product.title
        self.priceProductLabel.text = String(product.price)
    }
}
