//
//  Profile.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 10.10.2025.
//

struct Profile: Sendable, Codable {
    let name: String
    let description: String?
    let likes: [String]
    let website: String
}

