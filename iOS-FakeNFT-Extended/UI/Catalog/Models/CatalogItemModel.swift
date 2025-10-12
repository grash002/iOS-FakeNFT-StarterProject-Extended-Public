//
//  Collection.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 26.08.2025.
//

import Foundation

struct CatalogItemModel: Codable, Identifiable {
    let createdAt: String
    let name: String
    let cover: String
    let nfts: [String]
    let description: String
    let author: String
    let id: String
    
    static let mockData: [CatalogItemModel] = [
        CatalogItemModel(createdAt: "2023-04-21T02:22:27Z",
                         name: "Peach",
                         cover: "Peach",
                         nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft",],
                         description: "Персиковый — как облака над закатным солнцем в океане. В этой коллекции совмещены трогательная нежность и живая игривость сказочных зефирных зверей.",
                         author: "John Doe1",
                         id: "1"),
        
        CatalogItemModel(createdAt: "2023-04-22T02:22:27Z",
                         name: "Blue",
                         cover: "Blue",
                         nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft", "7nft", "8nft", "9nft", "10nft"],
                         description: "Descr2",
                         author: "John Doe2",
                         id: "2"),
        
        CatalogItemModel(createdAt: "2023-04-23T02:22:27Z",
                         name: "Brown",
                         cover: "Brown",
                         nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft", "7nft", "8nft"],
                         description: "Descr3",
                         author: "John Doe3",
                         id: "3"),
        
        CatalogItemModel(createdAt: "2023-04-24T02:22:27Z",
                         name: "Green",
                         cover: "Green",
                         nfts: ["1nft", "2nft", "3nft", "4nft", "5nft", "6nft", "7nft", "8nft", "9nft"],
                         description: "Descr4",
                         author: "John Doe4",
                         id: "4"),
    ]
}

