//
//  BOCustomerServices.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 02/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class CustomerServices {
    
    private var googleAPIKey = "YOUR_API_KEY"
    private var googleURL: URL {
        return URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleAPIKey)")!
    }
    
//    func search(image: String) {
//            // Create our request URL
//
//            var request = URLRequest(url: googleURL)
//            request.httpMethod = "POST"
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")
//
//            // Build our API request
//            let jsonRequest = [
//                "requests": [
//                    "image": [
//                        "content": imageBase64
//                    ],
//                    "features": [
//                        [
//                            "type": "LABEL_DETECTION",
//                            "maxResults": 10
//                        ],
//                        [
//                            "type": "FACE_DETECTION",
//                            "maxResults": 10
//                        ]
//                    ]
//                ]
//            ]
//            let jsonObject = JSON(jsonDictionary: jsonRequest)
//
//            // Serialize the JSON
//            guard let data = try? jsonObject.rawData() else {
//                return
//            }
//
//            request.httpBody = data
//
//            // Run the request on a background thread
//            DispatchQueue.global().async { self.runRequestOnBackgroundThread(request) }
//        }
//
//    }
    
}
