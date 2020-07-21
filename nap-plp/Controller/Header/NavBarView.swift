//
//  ScreenHeader.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

@IBDesignable class NavBarView: ProductListScreenView {
    
    let xibName = "NavBarView"
    
    @IBOutlet weak var backBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var accountBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var shopBagBarButtonItem: UIBarButtonItem!
    
    override func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
