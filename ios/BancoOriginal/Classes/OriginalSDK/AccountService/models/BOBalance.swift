//
//  BOBalance.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct BOBalance: Codable {
    
    let currentBalance: String
    let availableLimit: Double
    let currentLimit: Double
    
    enum BOBalanceKeys: String, CodingKey {
        case currentBalance = "current_balance"
        case availableLimit = "available_limit"
        case currentLimit = "current_limit"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: BOBalanceKeys.self)
        currentBalance = try values.decode(String.self, forKey: .currentBalance)
        availableLimit = try values.decode(Double.self, forKey: .availableLimit)
        currentLimit = try values.decode(Double.self, forKey: .currentLimit)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BOBalanceKeys.self)
        try container.encode(currentBalance, forKey: .currentBalance)
        try container.encode(availableLimit, forKey: .availableLimit)
        try container.encode(currentLimit, forKey: .currentLimit)
    }

}
