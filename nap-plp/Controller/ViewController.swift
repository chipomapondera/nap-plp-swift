//
//  ViewController.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var products: Array<Dictionary<String,Any>> = [];
    var productManager = ProductManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(UINib(nibName: "ProductListItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell");
        productManager.fetchProducts();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = products[indexPath.row];
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductListItemCollectionViewCell;
        
        if let name = row["name"] as? String {
            productCell.productName.text = name;
        }
        
        if let price = row["price"] as? String{
            productCell.productPrice.text = price
        }
        
        if let badge = row["badges"] as? String{
            productCell.productBadge.text = badge
        }
        
        if let image = row["images"] as? UIImage{
            productCell.productImage.image = image
        }
        
        return productCell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*0.8)
    }
    
//    let productUrl = URL(string: "https://api.net-a-porter.com/NAP/GB/en/60/0/summaries?categoryIds=2")
//    
//    func loadData(){
//        let session = URLSession.shared.dataTask(with: URLRequest(url: productUrl!)) { (data, response, error) in
//            if let httpResponse = response as? HTTPURLResponse {
//                if(httpResponse.statusCode != 200) {
//                    //ERROR MESSAGE APPEARS
//                }
//            }
//            
//            if let productData = data {
//                if let json = try? JSONSerialization.jsonObject(with: productData, options: []) as? Dictionary<String,Any> {
//                    if let statusCode = json["status"] as? String {
//                        if(statusCode == "ok") {
//                            if let products = json["products"] as? Array<Dictionary<String,Any>> {
//                                self.products = products;
//                                DispatchQueue.main.async {
//                                    self.collectionView.reloadData()
//                                }
//                            } else {
//                                //ERROR, API REQUEST NOT OK
//                            }
//                        }
//                    } else {
//                        //ERROR, API REQUEST NOT OK
//                    }
//                } else {
//                    print("Error");
//                }
//            }
//        }
//        session.resume();
//    }
}

