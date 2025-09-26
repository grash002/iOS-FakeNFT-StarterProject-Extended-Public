//
//  CatalogDetailViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 24.09.2025.
//

import Foundation

class CatalogDetailViewModel:ObservableObject {
    // MARK: - Public Properties
    @Published var item: CatalogItemModel
    @Published var nfts: [NftItemModel]
    
    // MARK: - Initializers
    init(item: CatalogItemModel, nfts: [NftItemModel] = NftItemModel.mockData) {
        self.item = item
        self.nfts = nfts
    }
}
