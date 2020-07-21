//
//  FooterBarView.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 20/07/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

@IBDesignable class FooterBarView: ProductListScreenView {
    
    let xibName = "FooterBarView"
    
    @IBOutlet weak var homeFooterBarItem: UIView!
    @IBOutlet weak var designersFooterBarItem: UIView!
    @IBOutlet weak var shopFooterBarItem: UIView!
    @IBOutlet weak var editorialFooterBarItem: UIView!
    @IBOutlet weak var searchFooterBarItem: UIView!
    
    override func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
