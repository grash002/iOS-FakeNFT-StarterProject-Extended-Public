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
        
        favoriteService = FavoriteService(
            networkClient: DefaultNetworkClient(),
            storage: NftStorageImpl()
        )
        
        cartService = CartService(
            networkClient: DefaultNetworkClient(),
            storage: NftStorageImpl()
        )
        
        nftService = NftServiceImpl(
            networkClient: DefaultNetworkClient(),
            storage: NftStorageImpl()
        )
        
        loadData()
        addObservers()
    }
    
    func toggleCart(_ nft: Nft) {
        Task {
            ProgressHUD.animate(interaction: false)
            
            do {
                if cartService.contains(nft) {
                    try await cartService.remove(nft)
                } else {
                    try await cartService.add(nft)
                }
                ProgressHUD.dismiss()
            } catch {
                ProgressHUD.failed(error)
            }
        }
    }
    
    func toggleFavorite(_ nft: Nft) {
        Task {
            ProgressHUD.animate(interaction: false)
            
            do {
                if favoriteService.contains(nft) {
                    try await favoriteService.remove(nft)
                } else {
                    try await favoriteService.add(nft)
                }
                ProgressHUD.dismiss()
            } catch {
                ProgressHUD.failed(error)
            }
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
            .sink { [weak self] in self?.ntfsInCart = $0 }
            .store(in: &subscriptions)
        
        favoriteService.itemsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.ntfsInFavorite = $0 }
            .store(in: &subscriptions)
    }
}
