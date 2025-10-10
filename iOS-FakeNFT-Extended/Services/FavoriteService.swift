//
//  FavoriteService.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 07.10.2025.
//

import Foundation

protocol FavoriteProtocol {
    var itemsPublisher: Published<[String]>.Publisher { get }
    
    func add(_ nft: Nft) async throws
    func remove(_ nft: Nft) async throws
    func contains(_ nft: Nft) -> Bool
}

final class FavoriteService: FavoriteProtocol, ObservableObject {
    @Published private var items: [String] = []
    
    var itemsPublisher: Published<[String]>.Publisher { $items }
    
    private let networkClient: NetworkClient
    private let storage: NftStorage
    private let profileId = "1"

    init(networkClient: NetworkClient, storage: NftStorage) {
        self.storage = storage
        self.networkClient = networkClient
        loadLikes()
    }
    
    func add(_ nft: Nft) async throws {
        guard !items.contains(nft.id) else { return }
        items.append(nft.id)
        
        try await updateProfile()
    }
    
    func remove(_ nft: Nft) async throws {
        items.removeAll { $0 == nft.id }
        
        try await updateProfile()
    }
    
    func contains(_ nft: Nft) -> Bool {
        items.contains { $0 == nft.id }
    }
}

private extension FavoriteService {
    func updateProfile() async throws {
        let getRequest = GetProfileRequest(id: profileId)
        let profile: Profile = try await networkClient.send(request: getRequest)
        
        let updatedProfile: Profile = .init(
            name: profile.name,
            description: profile.description,
            likes: items,
            website: profile.website
        )
        
        let request = UpdateProfileRequest(id: profileId, profile: updatedProfile)
        _ = try await networkClient.send(request: request)
    }
    
    func loadLikes() {
        Task {
            let getRequest = GetProfileRequest(id: profileId)
            let profile: Profile = try await networkClient.send(request: getRequest)
            items = profile.likes
        }
    }
}
