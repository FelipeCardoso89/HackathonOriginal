//
//  BalanceCollectionCellViewModel.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class BalanceCollectionCellViewModel {
    
    private let model: BOBalance
 
    var currentBalanceTitle: String {
        return "Saldo atual"
    }
    
    var currentBalance: String {
        return "R$ \(model.currentBalance)"
    }
    
    var availableLimitTitle: String {
        return "Limite disponivel"
    }
    
    var availableLimit: String {
        return "R$ \(model.availableLimit)"
    }
    
    var currentLimitTitle: String {
        return "Limite atual"
    }
    
    var currentLimit: String {
        return "R$ \(model.availableLimit)"
    }
    
    init(model: BOBalance) {
        self.model = model
    }
    
}
