//
//  ViewController.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var productManager = ProductManager()
    var products: [ProductData.Summaries] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.productCellXib, bundle: nil), forCellWithReuseIdentifier: K.productCellIdentifier)
        productManager.performRequest(productURL: K.apiKey) { (Summaries) in
            print(Summaries)
        };
        populateProducts()
    }
    
    private func populateProducts() {
        products = [
            ProductData.Summaries(id: 1234053, name: "Beline smocked floral-print crepe midi dress", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 18000), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1234054, name: "Jamais cropped tie-detailed linen top", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 13238), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1234055, name: "Meridian linen wide-leg pants", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 19904), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1234061, name: "Celia belted linen shorts", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 16096), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1254656, name: "Smocked floral-print cotton-blend midi dress", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 47297), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1253570, name: "Stretch-knit top", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 29500), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1246790, name: "Ribbed wool turtleneck sweater", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 36500), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1254653, name: "Costa shirred bikini briefs", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 11711), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1246792, name: "Ribbed wool sweater", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 34000), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1254652, name: "Costa shirred bandeau bikini top ", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 11711), badges: ["In_Stock"])
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.productCellIdentifier, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.setup(with: product)
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width-20
        return CGSize(width: cellWidth/2, height: 361)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

