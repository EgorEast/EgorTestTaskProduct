//
//  NetworkProductManager.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 09.11.2021.
//

import Foundation

struct NetworkProductManager {
    func fetchProducts(completionHandler: @escaping ([Product]) -> Void) {
        
        let urlString = "https://fakestoreapi.com/products"
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, responce, error) in
            guard let data = data else {
                print("Error \(String(describing: error))")
                return
            }
            let productsOptional = self.parseJSON(withData: data)

            var products:[Product] = []
            productsOptional.forEach { product in
                if let bindProduct = product {
                    products.append(bindProduct)
                }
            }

            completionHandler(products)
        }

        task.resume()
    }
    
    func parseJSON(withData data: Data) -> [Product?] {
        let decoder = JSONDecoder()
        
        do {
            let productData = try decoder.decode([ProductData].self, from: data)
            
            let products = productData.map { data -> Product? in
                guard let product = Product(productData: data) else {
                    return nil
                }
                return product
            }
            
            return products
            
        } catch let error as NSError {
            print("Error In Parse \(error.localizedDescription)")
        }
        return [nil]
    }

}
