//
//  ProductCollectionViewCell.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 07/08/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productBadge: UILabel!
    
    func setup(with product: ProductData.Summaries) {
        let currency = product.price.currency
        let amount = product.price.amount
        let divisor = product.price.divisor
        let price = "\(currency)\(amount/divisor)"

//        productImage.image = UIImage(named: product.image) - testing simple data first
        productName.text = product.name
        productBadge.text = product.badges[0].uppercased().replacingOccurrences(of: "_", with: " ", options: NSString.CompareOptions.literal, range: nil)
        productPrice.text = price.replacingOccurrences(of: "GBP", with: "£", options: NSString.CompareOptions.literal, range: nil)
        
        print(productName.text!)
        print(productBadge.text!)
        print(productPrice.text!)
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
