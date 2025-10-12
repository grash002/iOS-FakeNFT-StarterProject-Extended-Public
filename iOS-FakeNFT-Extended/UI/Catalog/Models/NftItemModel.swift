//
//  NftItemModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 31.08.2025.
//

import Foundation

struct NftItemModel: Codable, Identifiable, Hashable  {
    let createdAt: String
    let name: String
    let images: [String]
    var rating: Int
    let description: String
    let price: Double
    let author: String
    let id: String
    
    static let mockData: [NftItemModel] = [
        NftItemModel(
            createdAt: "2024-01-15",
            name: "Archie",
            images: ["1"],
            rating: 4,
            description: "Mythical dragon in cosmic space",
            price: 1.5,
            author: "Alex Johnson",
            id: "1"
        ),
        NftItemModel(
            createdAt: "2024-01-16",
            name: "Digital",
            images: ["2"],
            rating: 5,
            description: "Virtual forest with neon trees",
            price: 2.3,
            author: "Sarah Miller",
            id: "2"
        ),
        NftItemModel(
            createdAt: "2024-01-17",
            name: "Neon",
            images: ["3"],
            rating: 3,
            description: "Cyberpunk samurai warrior",
            price: 0.8,
            author: "Ken Watanabe",
            id: "3"
        ),
        NftItemModel(
            createdAt: "2024-01-18",
            name: "Ocean",
            images: ["4"],
            rating: 4,
            description: "Underwater fantasy world",
            price: 1.7,
            author: "Maria Garcia",
            id: "4"
        ),
        NftItemModel(
            createdAt: "2024-01-19",
            name: "Quantum",
            images: ["5"],
            rating: 5,
            description: "Abstract geometric patterns",
            price: 3.2,
            author: "David Chen",
            id: "5"
        ),
        NftItemModel(
            createdAt: "2024-01-20",
            name: "Mecha",
            images: ["6"],
            rating: 4,
            description: "Robotic panther in urban jungle",
            price: 2.1,
            author: "Lisa Park",
            id: "6"
        ),
        NftItemModel(
            createdAt: "2024-01-21",
            name: "Celestial",
            images: ["7"],
            rating: 5,
            description: "Divine figure among stars",
            price: 4.5,
            author: "Emma Wilson",
            id: "7"
        ),
        NftItemModel(
            createdAt: "2024-01-22",
            name: "Pixel",
            images: ["8"],
            rating: 3,
            description: "Retro pixel art character",
            price: 0.9,
            author: "Tom Smith",
            id: "8"
        ),
        NftItemModel(
            createdAt: "2024-01-23",
            name: "Abyss",
            images: ["9"],
            rating: 4,
            description: "Mysterious deep-sea creature",
            price: 1.8,
            author: "James Brown",
            id: "9"
        ),
        NftItemModel(
            createdAt: "2024-01-24",
            name: "Solar",
            images: ["10"],
            rating: 5,
            description: "Energetic sun explosion art",
            price: 2.7,
            author: "Anna Kowalski",
            id: "10"
        )
    ]
}
