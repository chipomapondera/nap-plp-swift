//
//  ProductData.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 24/07/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import Foundation

struct ProductData: Decodable {
    let summaries: [Summaries]
    
    struct Summaries: Decodable {
        let id: Int
        let image: Image
        let name: String
        let price: Price
        let badges: [String]
        
        struct Image: Decodable {
            let urlTemplate: String
        }
        
        struct Price: Decodable {
            let currency: String
            let divisor: Int
            let amount: Int
        }

    }
}




