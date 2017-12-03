//
//  PriceOfferCellViewModel.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

class PriceOfferCellViewModel {

    private let model: PriceOffer
    
    private var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var productImage: UIImage {
        return model.productImage
    }
    
    var productName: String {
        return model.productName
    }
    
    var productPrice: String? {
        return currencyFormatter.string(from: model.productPrice as NSNumber)
    }
    
    init(model: PriceOffer) {
        self.model = model
    }

}
