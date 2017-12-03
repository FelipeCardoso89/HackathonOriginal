//
//  ProductOfferDetailViewController.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class ProductOfferDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    var viewModel: ProductOfferDetailViewModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        productNameLabel.text = viewModel?.productName
        productPriceLabel.text = viewModel?.productPrice
        productImage.image = viewModel?.productPhoto
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let viewModel = self.viewModel {
            self.configure(viewModel)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productImage.layer.cornerRadius = 58.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configure(_ viewModel: ProductOfferDetailViewModel) {
        self.productPriceLabel.text = viewModel.productPrice
        self.productNameLabel.text = viewModel.productName
        self.productImage.image = viewModel.productPhoto
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.stores.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if let store = viewModel?.stores[indexPath.row] {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferDetailCollectionViewCell", for: indexPath) as? OfferDetailCollectionViewCell {
                cell.configure(OfferDetailCollectionCellViewModel(model: store))
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else {
            return UICollectionViewCell()
        }
    
    }
    
}
