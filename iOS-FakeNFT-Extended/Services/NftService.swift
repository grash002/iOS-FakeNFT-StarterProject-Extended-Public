import Foundation

protocol NftService {
    func loadNft(id: String) async throws -> NftItemModel
    func loadNft<T: Decodable>(id: String) async throws -> T
}

@MainActor
final class NftServiceImpl: NftService {
    static let shared: NftServiceImpl = .init(
        networkClient: DefaultNetworkClient(),
        storage: NftStorageImpl()
    )
    
    private let networkClient: NetworkClient
    private let storage: NftStorage

    init(networkClient: NetworkClient, storage: NftStorage) {
        self.storage = storage
        self.networkClient = networkClient
    }
    
    func loadNft(id: String) async throws -> NftItemModel {
        let request = NFTRequest(id: id)
        let nft: NftItemModel = try await networkClient.send(request: request)
        return nft
    }
    
    func loadNft<T: Decodable>(id: String) async throws -> T {
        let request = NFTRequest(id: id)
        let nft: T = try await networkClient.send(request: request)
        return nft
    }
    
    func loadCollections() async throws -> [CatalogItemModel] {
        let request = CollectionRequest()
        let catalogs: [CatalogItemModel] = try await networkClient.send(request: request)
        return catalogs
    }
}
