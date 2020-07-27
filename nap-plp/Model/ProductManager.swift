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
    let productUrl = "https://api.net-a-porter.com/NAP/GB/en/60/0/summaries?categoryIds=2"
    
    func fetchProducts() {
        performRequest(productURL: productUrl)
    }
    
    func performRequest(productURL: String) {
        if let url = URL(string: productURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(productData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(productData: Data) {
        let decoder = JSONDecoder()
        var products = [Int: ProductData]()
        
        do {
            let decodedData = try decoder.decode(ProductData.self, from: productData)
            let parsedData = decodedData.summaries
            
//            let currency = parsedData[0].price.currency
//            let amount = parsedData[0].price.amount
//            let divisor = parsedData[0].price.divisor
//            let productPrice = "\(currency)\(amount/divisor)"

        } catch {
            print(error)
        }
    }
}


