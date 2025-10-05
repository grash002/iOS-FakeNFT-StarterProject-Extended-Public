//
//  NftCardViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 23.09.2025.
//

import Foundation

class NftCardViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var nft: NftItemModel
    @Published var isFavorite: Bool = false
    @Published var isBuy: Bool = false
    
    // MARK: - Initializers
    init(nft: NftItemModel) {
        self.nft = nft
    }
}
