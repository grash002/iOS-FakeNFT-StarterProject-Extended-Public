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
    @Published var state = ViewState.default
    
    // MARK: - Private Properties
    @MainActor
    private lazy var nftService = NftServiceImpl.shared
    
    // MARK: - Initializers
    init(item: CatalogItemModel, nfts: [NftItemModel] = []) {
        self.item = item
        self.nfts = nfts
        Task {
            await getNfts()
        }
    }
    
    @MainActor
    private func getNfts() async {
        do {
            state = .loading
            var nfts: [NftItemModel] = []
            for id in item.nfts {
                let newElement = try await nftService.loadNft(id: id)
                nfts.append(newElement)
            }
            self.nfts = nfts
            state = .success
        } catch {
            print("Fail load nft: \(error)")
            state = .failed
        }
    }
}
