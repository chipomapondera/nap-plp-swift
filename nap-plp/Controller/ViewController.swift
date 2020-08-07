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
    var products: [nap_plp.ProductData.Summaries] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.productCellXib, bundle: nil), forCellWithReuseIdentifier: K.productCellIdentifier)
//        productManager.performRequest(productURL: K.apiKey) { (Summaries) in
//            print(Summaries)
//        };
        populateProducts()
    }
    
    private func populateProducts() {
        products = [
            nap_plp.ProductData.Summaries(name: "Beline smocked floral-print crepe midi dress", badges: ["NET_SUSTAIN", "In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Jamais cropped tie-detailed linen top", badges: ["NET_SUSTAIN", "In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Meridian linen wide-leg pants", badges: ["NET_SUSTAIN", "In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Celia belted linen shorts", badges: ["NET_SUSTAIN", "In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Smocked floral-print cotton-blend midi dress", badges: ["In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Stretch-knit top", badges: ["In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Ribbed wool turtleneck sweater", badges: ["In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Costa shirred bikini briefs", badges: ["In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Ribbed wool sweater", badges: ["In_Stock"]),
            nap_plp.ProductData.Summaries(name: "Costa shirred bandeau bikini top ", badges: ["In_Stock"])
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        casting down "as! ProductCollectionViewCell" returns error: Could not cast value of type 'UICollectionViewCell' (0x7fff897dc580) to 'nap_plp.ProductCollectionViewCell' (0x106e8f018). So I can't set the properties for the cell
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

