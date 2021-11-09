//
//  Product.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 09.11.2021.
//

import Foundation

struct Product {
    var title: String = "Title"
    var image: String = ""
    var price: Double = 0.0
    var description: String = ""
    var category: Category = .empty

    
    init?(productData: ProductData) {
        title = productData.title
        image = productData.image
        price = productData.price
        description = productData.description!
        category = productData.category!
    }
    init(){
    }
}
