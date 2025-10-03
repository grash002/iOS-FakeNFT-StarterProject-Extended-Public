//
//  MockData.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 03.10.2025.
//

enum MockData {
    static let sampleNFTs = [
        NFTItem(name: "Archie", price: "1,8 ETH", rating: 2, imageName: "nft_example"),
        NFTItem(name: "Emma", price: "1,781 ETH", rating: 2, imageName: "nft_example"),
        NFTItem(name: "Stella", price: "1,18 ETH", rating: 2, imageName: "nft_example"),
        NFTItem(name: "Toast", price: "1,28 ETH", rating: 2, imageName: "nft_example"),
        NFTItem(name: "Zeus", price: "1,38 ETH", rating: 2, imageName: "nft_example")
    ]
    
    static let users = [
        User(
            name: "Alex",
            avatar: "person.circle.fill",
            nftCount: 112,
            
            bio: "Дизайнер из Казани, люблю цифровое искусство и бейсы. В моей коллекции уже 100+ NFT, и еще больше — на моём сайте. Открыт к коллаборациям.",
            
            websiteURL: "https://practicum.yandex.ru",
            nftCollection: sampleNFTs
        ),
        User(name: "Bill", avatar: "person.circle.fill", nftCount: 98,
             bio: "Коллекционер цифрового искусства. Интересуюсь современными NFT проектами.",
             websiteURL: "https://practicum.yandex.ru",
             nftCollection: sampleNFTs),
        User(name: "Alla", avatar: "person.circle.fill", nftCount: 72,
             bio: "Художник и крипто энтузиаст. Создаю уникальные NFT.",
             websiteURL: "https://practicum.yandex.ru",
             nftCollection: sampleNFTs),
        User(name: "Mads", avatar: "person.circle.fill", nftCount: 71,
             bio: "NFT коллекционер и инвестор в цифровое искусство.",
             websiteURL: "https://practicum.yandex.ru",
             nftCollection: sampleNFTs),
        User(name: "Timothée", avatar: "person.circle.fill", nftCount: 51,
             bio: "Люблю искусство и технологии. Собираю редкие NFT.",
             websiteURL: "https://practicum.yandex.ru",
             nftCollection: sampleNFTs),
        User(name: "Lea", avatar: "person.circle.fill", nftCount: 23,
             bio: "Начинающий коллекционер NFT. Изучаю рынок.",
             websiteURL: "https://practicum.yandex.ru",
             nftCollection: sampleNFTs),
        User(name: "Eric", avatar: "person.circle.fill", nftCount: 11,
             bio: "Новичок в мире NFT. Интересуюсь цифровым искусством.",
             websiteURL: "https://practicum.yandex.ru",
             nftCollection: sampleNFTs)
    ]
}
