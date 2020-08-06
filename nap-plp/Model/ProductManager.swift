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
    let productUrl = K.apiKey
    
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
    
    private func parseJSON(productData: Data, completion: @escaping ([ProductData.Summaries]) -> Void) {
        let decoder = JSONDecoder()
        if let response = try? decoder.decode(ProductData.self, from: productData) {
            completion(response.summaries)
        }
    }
}


