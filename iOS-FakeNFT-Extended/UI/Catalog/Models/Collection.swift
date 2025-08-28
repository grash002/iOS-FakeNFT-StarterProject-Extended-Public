//
//  Collection.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 26.08.2025.
//

import Foundation

struct Collection: Codable, Identifiable {
    let createdAt: String
    let name: String
    let cover: String
    let nfts: [String]
    let description: String
    let author: String
    let id: String
    
    static let mockData: [Collection] = [
        Collection(createdAt: "2023-04-21T02:22:27Z",
                   name: "Peach",
                   cover: "Peach",
                   nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft",],
                   description: "",
                   author: "1",
                   id: "1"),
        
        Collection(createdAt: "2023-04-22T02:22:27Z",
                   name: "Blue",
                   cover: "Blue",
                   nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft", "7nft", "8nft", "9nft", "10nft"],
                   description: "",
                   author: "1",
                   id: "2"),
        
        Collection(createdAt: "2023-04-23T02:22:27Z",
                   name: "Brown",
                   cover: "Brown",
                   nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft", "7nft", "8nft"],
                   description: "",
                   author: "1",
                   id: "3"),
        
        Collection(createdAt: "2023-04-24T02:22:27Z",
                   name: "Green",
                   cover: "Green",
                   nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft", "7nft", "8nft", "9nft"],
                   description: "",
                   author: "1",
                   id: "4"),
    ]
}

