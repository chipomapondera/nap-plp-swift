//
//  ProductManager.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 24/07/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import Foundation
import UIKit

protocol ProductManagerDelegate {
    func getProducts(products: [ProductData.Summaries])
}

struct ProductManager {
    let productUrl = "https://api.net-a-porter.com/NAP/GB/en/1/0/summaries?categoryIds=2"
    var delegate: ProductManagerDelegate?
    
    func fetchProducts() {
        performRequest(productURL: productUrl){(products) -> () in            
                print(products)
            self.delegate?.getProducts(products: products)
        }
    }
    
    func performRequest(productURL: String, completion: @escaping ([ProductData.Summaries]) -> Void) {
        
        if let url = URL(string: productURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(productData: safeData, completion: completion)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(productData: Data, completion: @escaping ([ProductData.Summaries]) -> Void) {
        let decoder = JSONDecoder()
        if let response = try? decoder.decode(ProductData.self, from: productData) {
            completion(response.summaries)
        }
    }
}


