//
//  CartService.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 07.10.2025.
//

import Foundation

protocol CartProtocol {
    var itemsPublisher: Published<[Nft]>.Publisher { get }
    
    func add(_ nft: Nft)
    func remove(_ nft: Nft)
    func contains(_ nft: Nft) -> Bool
    func clear()
    func getList() -> [Nft]
}

final class CartService: CartProtocol {
    static let shared: CartProtocol = CartService()
    
    @Published private var items: [Nft] = []
    
    var itemsPublisher: Published<[Nft]>.Publisher { $items }
    
    func add(_ nft: Nft) {
        guard !items.contains(where: { $0.id == nft.id }) else { return }
        items.append(nft)
    }
    
    func remove(_ nft: Nft) {
        items.removeAll { $0.id == nft.id }
    }
    
    func contains(_ nft: Nft) -> Bool {
        items.contains { $0.id == nft.id }
    }
    
    func clear() {
        items.removeAll()
    }
    
    func getList() -> [Nft] {
        items
    }
}
