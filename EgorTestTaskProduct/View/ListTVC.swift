//
//  ListTVC.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 09.11.2021.
//

import UIKit

class ListTVC: UITableViewController {
    
    let networkProductManager = NetworkProductManager()
    var productsArray: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        addProducts()
    }

    func addProducts() {
        networkProductManager.fetchProducts {  products in

            products.forEach({ product in
                self.productsArray.append(product)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell
        
        if productsArray.count > 0 {
            
            var product = Product()
            product = productsArray[indexPath.row]

            cell.configure(product: product)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            let currentCell: UITableViewCell = sender as! UITableViewCell
            
            let originalFrame = currentCell.frame
            let center = currentCell.center
            let cellContentView = currentCell.contentView
            
            UIView.animate(withDuration: 4) {
                var cellFrame = currentCell.frame
                cellFrame.size.height = cellFrame.size.height + 88
                cellFrame.origin.y = cellFrame.origin.y - 44
                
                currentCell.center = center
                
                cellContentView.frame.origin.y = 44
                
                currentCell.frame = cellFrame
                
            } completion: { (bool) in
                currentCell.frame = originalFrame
            }
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let product = productsArray[indexPath.row]
            let dstVC = segue.destination as! DetailVC
            
            dstVC.productModel = product
            
        }
    }
}







