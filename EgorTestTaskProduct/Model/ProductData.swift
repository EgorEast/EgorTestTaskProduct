//
//  ProductData.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 09.11.2021.
//

import Foundation

struct ProductData: Codable {
    let title: String
    let image: String
    let price: Double
    let description: String?
    let category: Category?
}


enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
    case empty = ""
}
