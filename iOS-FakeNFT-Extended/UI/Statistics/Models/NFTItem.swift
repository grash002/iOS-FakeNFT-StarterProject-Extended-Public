//
//  NFTItem.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 03.10.2025.
//

import Foundation

struct NFTItem: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let rating: Int
    let imageName: String
    var isLiked: Bool = false
    var isInCart: Bool = false
}
