//
//  NFTCollectionViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 06.10.2025.
//

import Foundation
import ProgressHUD

@MainActor
final class NFTCollectionViewModel: ObservableObject {
    @Published private(set) var ntfs: [Nft] = []
    
    private let nftService: NftService
    private let user: User
    
    init(user: User) {
        self.user = user
        
        nftService = NftServiceImpl(
            networkClient: DefaultNetworkClient(),
            storage: NftStorageImpl()
        )
        
        loadData()
    }
    
    func loadData() {
        guard !user.nfts.isEmpty else { return }
        
        Task {
            ProgressHUD.animate(interaction: false)
            
            var ntfs: [Nft] = []
            for id in user.nfts {
                guard let object = try? await nftService.loadNft(id: id)
                else { continue }
                ntfs.append(object)
            }
            
            self.ntfs = ntfs
            ProgressHUD.dismiss()
        }
    }
}
