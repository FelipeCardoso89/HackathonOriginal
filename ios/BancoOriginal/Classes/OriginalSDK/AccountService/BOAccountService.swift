//
//  BOAccountService.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import Moya

enum BOAccountService {
    case balance(version: OriginalAPIVersion)
}

// MARK: - TargetType Protocol Implementation
extension BOAccountService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://sandbox.original.com.br/accounts")!
    }
    
    var path: String {
        switch self {
        case let .balance(version):
            return "\(version.rawValue)/balance"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .balance:
            return .get
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return [
            "Contetype": "application/json",
            "Authorization": BancoOriginal.shared.accessToken,
            "developer-key": BancoOriginal.shared.developerKey
        ]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
