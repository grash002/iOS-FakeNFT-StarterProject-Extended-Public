//
//  UpdateOrders.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 10.10.2025.
//

import Foundation

struct UpdateOrdersRequest: NetworkRequest {
    let id: String
    let orders: Orders
    
    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/orders/\(id)")
    }
    
    var httpMethod: HttpMethod { .put }
    
    var dto: Encodable? {
        orders
    }
}
