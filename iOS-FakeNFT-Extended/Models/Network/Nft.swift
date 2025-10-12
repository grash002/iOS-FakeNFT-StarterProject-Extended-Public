import Foundation

struct Nft: Decodable, Identifiable {
    let id: String
    let images: [URL]
    let name: String
    let price: Double
    let rating: Int
}
