//
//  OfferDetailCollectionCellViewModel.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class OfferDetailCollectionCellViewModel {
    
    private let model: StoreInfo
    
    var storeName: String {
        return model.title
    }
    
    var storeImage: UIImage {
        return model.image
    }
    
    init(model: StoreInfo) {
        self.model = model
    }
    
}
