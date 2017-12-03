//
//  PriceOfferCollectionViewCell.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit
import AlamofireImage

class PriceOfferCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPrice: UILabel!
    
    func configure(_ viewModel: PriceOfferCellViewModel) {
        productImageView.image = viewModel.productImage
        productNameLabel.text = viewModel.productName
        productPrice.text = viewModel.productPrice
    }
}
