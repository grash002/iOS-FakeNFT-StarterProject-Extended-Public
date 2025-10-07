//
//  NFTCollectionViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 06.10.2025.
//

import Foundation
import ProgressHUD
import Combine

@MainActor
final class NFTCollectionViewModel: ObservableObject {
    @Published private(set) var ntfs: [Nft] = []
    @Published private(set) var ntfsInCart: [String] = []
    @Published private(set) var ntfsInFavorite: [String] = []
    
    private let cartService: CartProtocol
    private let favoriteService: FavoriteProtocol
    private let nftService: NftService
    private let user: User
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(user: User) {
        self.user = user
        
        favoriteService = FavoriteService.shared
        cartService = CartService.shared
        
        nftService = NftServiceImpl(
            networkClient: DefaultNetworkClient(),
            storage: NftStorageImpl()
        )
        
        loadData()
        addObservers()
    }
    
    func toggleCart(_ nft: Nft) {
        if cartService.contains(nft) {
            cartService.remove(nft)
        } else {
            cartService.add(nft)
        }
    }
    
    func toggleFavorite(_ nft: Nft) {
        if favoriteService.contains(nft) {
            favoriteService.remove(nft)
        } else {
            favoriteService.add(nft)
        }
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
    
    func addObservers() {
        cartService.itemsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.ntfsInCart = $0.map(\.id) }
            .store(in: &subscriptions)
        
        favoriteService.itemsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.ntfsInFavorite = $0.map(\.id) }
            .store(in: &subscriptions)
    }
}
