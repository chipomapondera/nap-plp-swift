//
//  ScreenHeader.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit


@IBDesignable class ScreenHeaderView: ProductListScreenView {
    
    var view = ViewController()
    
    let xibName = K.screenHeaderXib
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
        
    override func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
