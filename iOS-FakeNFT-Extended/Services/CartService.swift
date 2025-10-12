//
//  CartService.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 07.10.2025.
//

import Foundation

protocol CartProtocol {
    var itemsPublisher: Published<[String]>.Publisher { get }
    
    func add(_ nft: Nft) async throws
    func remove(_ nft: Nft) async throws
    func contains(_ nft: Nft) -> Bool
}

final class CartService: CartProtocol, ObservableObject {
    @Published var items: [String] = []
    
    var itemsPublisher: Published<[String]>.Publisher { $items }
    
    private let networkClient: NetworkClient
    private let storage: NftStorage
    private let profileId = "1"

    init(networkClient: NetworkClient, storage: NftStorage) {
        self.storage = storage
        self.networkClient = networkClient
        loadItems()
    }
    
    func add(_ nft: Nft) async throws {
        guard !items.contains(nft.id) else { return }
        items.append(nft.id)
        
        try await updateOrders()
    }
    
    func remove(_ nft: Nft) async throws {
        items.removeAll { $0 == nft.id }
        
        try await updateOrders()
    }
    
    func contains(_ nft: Nft) -> Bool {
        items.contains { $0 == nft.id }
    }
}

private extension CartService {
    func updateOrders() async throws {
        let getRequest = GetOrdersRequest(id: profileId)
        let orders: Orders = try await networkClient.send(request: getRequest)
        
        let updatedOrders: Orders = .init(
            nfts: items
        )
        
        let request = UpdateOrdersRequest(id: profileId, orders: updatedOrders)
        _ = try await networkClient.send(request: request)
    }
    
    func loadItems() {
        Task {
            let getRequest = GetOrdersRequest(id: profileId)
            let profile: Orders = try await networkClient.send(request: getRequest)
            items = profile.nfts
        }
    }
}
