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
            ProductData.Summaries(id: 1234053, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1234053/1234053_in_m2.jpg"), name: "Beline smocked floral-print crepe midi dress", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 18000), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1234054, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1234054/1234054_in_m2.jpg"), name: "Jamais cropped tie-detailed linen top", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 13238), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1234055, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1234055/1234055_in_m2.jpg"), name: "Meridian linen wide-leg pants", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 19904), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1234061, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1234061/1234061_in_m2.jpg"), name: "Celia belted linen shorts", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 16096), badges: ["NET_SUSTAIN", "In_Stock"]),
            ProductData.Summaries(id: 1254656, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1254656/1254656_in_m2.jpg"), name: "Smocked floral-print cotton-blend midi dress", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 47297), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1253570, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1253570/1253570_in_m2.jpg"), name: "Stretch-knit top", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 29500), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1246790, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1246790/1246790_in_m2.jpg"), name: "Ribbed wool turtleneck sweater", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 36500), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1254653, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1254653/1254653_in_m2.jpg"), name: "Costa shirred bikini briefs", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 11711), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1246792, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1246792/1246792_in_m2.jpg"), name: "Ribbed wool sweater", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 34000), badges: ["In_Stock"]),
            ProductData.Summaries(id: 1254652, image: nap_plp.ProductData.Summaries.Image(urlTemplate: "https://cache.net-a-porter.com/images/products/1254652/1254652_in_m2.jpg"), name: "Costa shirred bandeau bikini top ", price: nap_plp.ProductData.Summaries.Price(currency: "GBP", divisor: 100, amount: 11711), badges: ["In_Stock"])
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
        return 20;
    }
    
}

