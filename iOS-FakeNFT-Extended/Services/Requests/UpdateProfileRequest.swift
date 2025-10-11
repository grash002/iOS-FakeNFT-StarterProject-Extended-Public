//
//  UpdateProfileRequest.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 06.10.2025.
//

import Foundation

struct UpdateProfileRequest: NetworkRequest {
    let id: String
    let profile: Profile
    
    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/profile/\(id)")
    }
    
    var httpMethod: HttpMethod { .put }
    
    var contentType: ContentType { .urlEncoded }
    
    var dto: Encodable? {
        profile
    }
}
