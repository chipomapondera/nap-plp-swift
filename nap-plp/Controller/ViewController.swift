//
//  ViewController.swift
//  nap-plp
//
//  Created by Chipo Mapondera on 18/06/2020.
//  Copyright © 2020 Chipo Mapondera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    var productManager = ProductManager()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductListItemCollectionViewCell.self, forCellWithReuseIdentifier: K.productCellIdentifier)
        collectionView.register(UINib(nibName: K.productCellXib, bundle: nil), forCellWithReuseIdentifier: K.productCellIdentifier)
        productManager.performRequest(productURL: K.apiKey) { (Summaries) in
            print(Summaries)
        };
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.productCellIdentifier, for: indexPath) as! ProductListItemCollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width-20
        return CGSize(width: cellWidth/2, height: cellWidth*0.8)
    }
    
}

