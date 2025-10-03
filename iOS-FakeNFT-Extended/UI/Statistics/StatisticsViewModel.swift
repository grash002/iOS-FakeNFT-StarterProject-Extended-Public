//
//  StatisticsViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import Foundation
import Combine

final class StatisticsViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var sortedUsers: [User] = []
    @Published var showSortSheet = false
    @Published var currentSort: SortOption = .rating
    
    init() {
        loadUsers()
        applySorting()
    }
    
    private func loadUsers() {
        users = [
            User(name: "Alex", avatar: "person.circle.fill", nftCount: 112, 
                 bio: "Дизайнер из Казани, люблю цифровое искусство и бейсы. В моей коллекции уже 100+ NFT, и еще больше — на моём сайте. Открыт к коллаборациям.", 
                 websiteURL: "alex.design"),
            User(name: "Bill", avatar: "person.circle.fill", nftCount: 98,
                 bio: "Коллекционер цифрового искусства. Интересуюсь современными NFT проектами.",
                 websiteURL: "bill.nft"),
            User(name: "Alla", avatar: "person.circle.fill", nftCount: 72,
                 bio: "Художник и крипто энтузиаст. Создаю уникальные NFT.",
                 websiteURL: "alla.art"),
            User(name: "Mads", avatar: "person.circle.fill", nftCount: 71,
                 bio: "NFT коллекционер и инвестор в цифровое искусство.",
                 websiteURL: "mads.collection"),
            User(name: "Timothée", avatar: "person.circle.fill", nftCount: 51,
                 bio: "Люблю искусство и технологии. Собираю редкие NFT.",
                 websiteURL: "timothee.nft"),
            User(name: "Lea", avatar: "person.circle.fill", nftCount: 23,
                 bio: "Начинающий коллекционер NFT. Изучаю рынок.",
                 websiteURL: "lea.crypto"),
            User(name: "Eric", avatar: "person.circle.fill", nftCount: 11,
                 bio: "Новичок в мире NFT. Интересуюсь цифровым искусством.",
                 websiteURL: "eric.art")
        ]
    }
    
    func applySorting() {
        switch currentSort {
        case .rating:
            sortedUsers = users.sorted { $0.nftCount > $1.nftCount }
        case .name:
            sortedUsers = users.sorted { $0.name < $1.name }
        }
    }
    
    func sortByName() {
        currentSort = .name
        applySorting()
        showSortSheet = false
    }
    
    func sortByRating() {
        currentSort = .rating
        applySorting()
        showSortSheet = false
    }
}
