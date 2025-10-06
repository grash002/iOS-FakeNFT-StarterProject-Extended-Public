//
//  User.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import Foundation

struct User: Identifiable, Sendable, Codable {
    let id: String
    let name: String
    let description: String?
    let nfts: [String]
    let avatar: String
    let rating: String
    let website: String
    
    var nftCount: Int {
        nfts.count
    }
}

enum SortOption {
    case name
    case rating
}
