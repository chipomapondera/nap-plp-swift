//
//  FilterBarView.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 19/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

@IBDesignable class FilterBarView: ProductListScreenView {
    
    let xibName = K.filterBarXib
    
    @IBOutlet weak var refineLabel: UILabel!
    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var recommendedLabel: UILabel!
    
        
    override func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
