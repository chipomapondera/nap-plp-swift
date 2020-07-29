//
//  ViewController.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ProductManagerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var product = 60
    var productManager = ProductManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(UINib(nibName: "ProductListItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell");
        productManager.fetchProducts();
        productManager.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProducts(products: [ProductData.Summaries]) {
        print(products)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let row = products[indexPath.row];
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductListItemCollectionViewCell;
        
//        if let name = row["name"] as? String {
//            productCell.productName.text = name;
//        }
//
//        if let price = row["price"] as? String{
//            productCell.productPrice.text = price
//        }
//
//        if let badge = row["badges"] as? String{
//            productCell.productBadge.text = badge
//        }
//
//        if let image = row["images"] as? UIImage{
//            productCell.productImage.image = image
//        }
//
        return productCell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*0.8)
    }
}

