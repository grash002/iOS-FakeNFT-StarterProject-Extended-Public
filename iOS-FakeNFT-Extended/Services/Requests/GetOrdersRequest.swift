//
//  GetOrdersRequest.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 10.10.2025.
//

import Foundation

struct GetOrdersRequest: NetworkRequest {
    let id: String
    
    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/orders/\(id)")
    }
}
