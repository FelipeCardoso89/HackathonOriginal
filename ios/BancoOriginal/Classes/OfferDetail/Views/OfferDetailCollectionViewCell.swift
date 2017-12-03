//
//  OfferDetailCollectionViewCell.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class OfferDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var storeImageView: UIImageView!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var storeRateImageView: UIImageView!
    
    func configure(_ viewModel: OfferDetailCollectionCellViewModel) {
        storeImageView.image = viewModel.storeImage
        storeNameLabel.text = viewModel.storeName
    }
    
}
