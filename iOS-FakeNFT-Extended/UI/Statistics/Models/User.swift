//
//  User.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import Foundation

struct User: Identifiable, Sendable {
    let id = UUID()
    let name: String
    let avatar: String
    let nftCount: Int
    let bio: String
    let websiteURL: String
    var nftCollection: [NFTItem] = []
}

enum SortOption {
    case name
    case rating
}
