//
//  StatisticsService.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 06.10.2025.
//

import Foundation

protocol StatisticsProtocol: Actor {
    func loadUsers() async throws -> [User]
}

actor StatisticsService: StatisticsProtocol {
    static let shared: StatisticsProtocol = StatisticsService()
    
    private let networkClient: NetworkClient = DefaultNetworkClient()
    private let storage: NftStorage = NftStorageImpl()
    private let usersListSize = 25

    private var usersListPage = 0
    
    private init() {}
    
    func loadUsers() async throws -> [User] {
        let request = UsersListRequest(page: usersListPage, size: usersListSize)
        let users: [User] = try await networkClient.send(request: request)
        return users
    }
}
