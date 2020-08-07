//
//  ProductCollectionViewCell.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 07/08/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
        
    private let productImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let productName: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        return label
    }()
    
    let productPrice: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        return label
    }()
    
    let productBadge: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        return label
    }()
    
    func setup(with product: ProductData.Summaries) {
        
        productName.text = product.name
        productBadge.text = product.badges[0]
        
//        productImage.image = UIImage(named: product.image) - testing simple data first
//        productPrice.text = product.price - testing simple data first

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
