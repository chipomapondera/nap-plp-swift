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
        
        let imageUrl = product.image.urlTemplate

//        productImage.image =
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

extension UIImageView {
    func downloadImageFrom(url:URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {return}
        downloaded(from: url, contentMode: mode)
    }
}
