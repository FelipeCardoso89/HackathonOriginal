//
//  ProductHeaderReusableView.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

struct ProductHeader {
    let productImage: UIImage
    let productTitle: String
    let price: String
}

protocol ProductHeaderReusableViewDelegate: class {
    func showPriceVariance()
}

class ProductHeaderReusableView: UICollectionReusableView {
        
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var delegate: ProductHeaderReusableViewDelegate?
    
    func configure(_ productHeader: ProductHeader) {
        self.productImageView.image = productHeader.productImage
        self.productTitle.text = productHeader.productTitle
        self.priceLabel.text = productHeader.price
        self.backgroundColor = UIColor(red:0.39, green:0.69, blue:0.32, alpha:1.0)
    }
    
    @IBAction func performAction(_ sender: Any) {
        self.delegate?.showPriceVariance()
    }
    
}
