//
//  CatalogViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 26.08.2025.
//

import SwiftUI

class CatalogViewModel: ObservableObject {
    @Published var items = Collection.mockData
    @Published var selectedSort = SortOptions.byName
    
    init() {
        getCatalogItems()
    }
    
    func sortItems(by options: SortOptions) {
        selectedSort = options
        switch options {
        case .byName:
            items.sort { $0.name < $1.name }
        case .byCountNft:
            items.sort { $0.nfts.count > $1.nfts.count }
        }
    }
    
    private func getCatalogItems() {
        //TODO: Connect with api
    }
}
