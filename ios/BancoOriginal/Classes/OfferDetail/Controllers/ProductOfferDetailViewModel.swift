//
//  ProductOfferDetailViewModel.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class ProductOfferDetailViewModel {
    
    private let priceOffer: PriceOffer
    
    private var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter
    }()
    
    init(priceOffer: PriceOffer) {
        self.priceOffer = priceOffer
    }
    
    var productName: String {
        return priceOffer.productName
    }
    
    var productPhoto: UIImage {
        return priceOffer.productImage
    }
    
    var productPrice: String? {
        return currencyFormatter.string(from: priceOffer.productPrice as NSNumber)
    }
    
    var stores:  [StoreInfo] {
        return [
            StoreInfo(image: UIImage(named: "Loja1")!, title: "Amazing store"),
            StoreInfo(image: UIImage(named: "Loja2")!, title: "Great store"),
            StoreInfo(image: UIImage(named: "Loja3")!, title: "Not great store")
        ]
    }
    
    
}
