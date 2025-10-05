import Foundation

protocol NftService {
    func loadNft(id: String) async throws -> NftItemModel
}

@MainActor
final class NftServiceImpl: NftService {
    static let shared: NftServiceImpl = .init()
    
    private let networkClient: NetworkClient = DefaultNetworkClient()
    private let storage: NftStorage = NftStorageImpl()
    
    private init() {}
    
    func loadNft(id: String) async throws -> NftItemModel {
//        if let nft = await storage.getNft(with: id) {
//            return nft
//        }

        let request = NFTRequest(id: id)
        let nft: NftItemModel = try await networkClient.send(request: request)
//        await storage.saveNft(nft)
        return nft
    }
    
    func loadCollections() async throws -> [CatalogItemModel] {
        let request = CollectionRequest()
        let catalogs: [CatalogItemModel] = try await networkClient.send(request: request)
        return catalogs
    }
}
