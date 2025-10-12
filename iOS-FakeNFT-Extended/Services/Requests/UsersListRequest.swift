//
//  UsersListRequest.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 06.10.2025.
//

import Foundation

struct UsersListRequest: NetworkRequest {
    let page: Int
    let size: Int

    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/users?page=\(page)&size=\(size)")
    }
}
