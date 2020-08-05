//
//  ProductManager.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 24/07/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import Foundation
import UIKit

struct ProductManager {
    let productUrl = "https://api.net-a-porter.com/NAP/GB/en/1/0/summaries?categoryIds=2"
    
    func fetchProducts() {
        performRequest(productURL: productUrl){(products) -> () in            
                print("performRequest function is running")
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


