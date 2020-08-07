//
//  ProductCollectionViewCell.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 07/08/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productViewCell: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productBadge: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
