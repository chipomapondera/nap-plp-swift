//
//  ProductListItemCollectionViewCell.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

@IBDesignable class ProductListItemCollectionViewCell: UICollectionViewCell {
    
    let xibName = "ProductListItemCollectionViewCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productBadge: UILabel!
    
    
}
