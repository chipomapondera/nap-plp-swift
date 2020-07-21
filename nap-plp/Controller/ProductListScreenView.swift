//
//  ProductListView.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 20/07/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ProductListScreenView: UIView {
    
    var contentView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        super.prepareForInterfaceBuilder()
        commonInit()
        contentView?.prepareForInterfaceBuilder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        
    }
    
    private func commonInit() {
        guard let view = loadViewFromXib() else {return}
        view.frame = bounds
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: String(describing: self), bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
