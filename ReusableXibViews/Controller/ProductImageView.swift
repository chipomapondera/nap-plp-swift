//
//  ProductImageView.swift
//  ReusableXibViews
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

@IBDesignable class ProductImageView: UIView {
    
    let xibName = "ProductImageView"
    var contentView: UIView?
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        super.prepareForInterfaceBuilder()
        commonInit()
        contentView?.prepareForInterfaceBuilder()
    }
    
    private func commonInit() {
        guard let view = loadViewFromXib() else {return}
        view.frame = bounds
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        return xib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
