//
//  BOAccountServices.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import Moya

class BOAccountServices {

    private let provider = MoyaProvider<BOAccountService>()
    
    func balance(completion: @escaping ((BOBalance?, NSError?) -> Void)) {
    
        provider.request(.balance(version: .v1)) { (result) in
            
            switch result{
            case let .success(response):
                
                if let object = try? JSONDecoder().decode(BOBalance.self, from: response.data) {
                    completion(object, nil)
                } else {
                    completion(nil, nil)
                }
                
            case let .failure(error):
                completion(nil, error as NSError)
            }
        }
    }
    
}
