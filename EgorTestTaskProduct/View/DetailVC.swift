//
//  DetailVC.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 09.11.2021.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var titleProductLabel: UILabel!
    @IBOutlet weak var imageProductView: UIImageView!
    
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var descriptionProductLabel: UILabel!
    @IBOutlet weak var categoryProductLabel: UILabel!
    
    var productModel: Product?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshLabels()
    }
    
    func refreshLabels() {
        titleProductLabel.text = productModel?.title
        if let url = URL(string: (productModel?.image)!){
            imageProductView.load(url: url)
        }
        priceProductLabel.text = "\((productModel?.price)!)"
        descriptionProductLabel.text = productModel?.description
        categoryProductLabel.text = "\((productModel?.category.rawValue)!)"
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            
        }
    }
}
