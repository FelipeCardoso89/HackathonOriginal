//
//  BancoOriginal.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

enum OriginalAPIVersion: String {
    case v1
}


class BancoOriginal {
    
    static let shared = BancoOriginal(developerKey: "28f955c90b3a2940134ff1a970050f569a87facf")

    let developerKey: String
    let accessToken: String = "Bearer ZTIyNTBhZDAtZDdjZi0xMWU3LWE3YzAtMDA1MDU2OWE3MzA1OmV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUowZVhCbElqb2lUMEYxZEdnaUxDSnBZWFFpT2pFMU1USXlOamMwTmpBc0ltVjRjQ0k2TVRVeE1qWTVPVFEyTUN3aVlYVmtJam9pTldJMFpqZG1PR1lpTENKcGMzTWlPaUphZFhBdWJXVWdSMkYwWlhkaGVTSXNJbk4xWWlJNkltVXlNalV3WVdRd0xXUTNZMll0TVRGbE55MWhOMk13TFRBd05UQTFOamxoTnpNd05TSXNJbXAwYVNJNklqSXpNVGN5WW1Vd0xXUTNaREF0TVRGbE55MWlZelV4TFRjeE5HUXdZMlkwTWpBeFl5Sjkub250QzZHUm1EaC1hc1JHRi1JdThJYllOc09NUFJYVEM1QUVRVDJLUmh5Yw=="
    
    lazy var accountService: BOAccountServices = {
        return BOAccountServices()
    }()
    
    init(developerKey: String) {
        self.developerKey = developerKey
    }
    
}
