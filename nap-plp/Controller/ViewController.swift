//
//  ViewController.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var productManager = ProductManager()
    var products: [Int:String] = [
        1: "Print dress",
        2: "Long dress",
        3: "Striped dress"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(UINib(nibName: K.productCellXib, bundle: nil), forCellWithReuseIdentifier: K.productCellIdentifier);
        productManager.fetchProducts();
//        productManager.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProducts(products: [ProductData.Summaries]) {
        print("getProducts function is running")
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1;
//        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let row = products.startIndex;
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: K.productCellIdentifier, for: indexPath) as! ProductListItemCollectionViewCell;
        
        if let name = products[1] {
            productCell.productName.text = name
        }
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
        
        return productCell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*0.8)
    }
}

