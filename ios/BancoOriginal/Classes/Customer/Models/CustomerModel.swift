//
//  CustomerModel.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct CustomerModel {
    let name: String
    let profilePhoto: URL?
    let balance: BOBalance
    let offers: [PriceOffer]
}
