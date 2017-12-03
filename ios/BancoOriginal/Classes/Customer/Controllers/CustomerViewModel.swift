//
//  CustomerViewModel.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class CustomerViewModel {
    
    private let model: CustomerModel
    
    var customerName: String {
        return model.name
    }
    
    var customerImage: URL? {
        return model.profilePhoto
    }
    
    var items: [Any] {
        var items: [Any] = [model.balance]
        model.offers.forEach { items.append($0) }
        return items
    }
    
    init(model: CustomerModel) {
        self.model = model
    }

}

