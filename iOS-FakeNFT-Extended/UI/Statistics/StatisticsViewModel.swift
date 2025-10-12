//
//  StatisticsViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import Foundation
import ProgressHUD

@MainActor
final class StatisticsViewModel: ObservableObject {
    @Published var sortedUsers: [User] = []
    @Published var showSortSheet = false
    @Published var currentSort: SortOption = .rating
    
    private let statisticsService: StatisticsProtocol = StatisticsService.shared
    
    init() {
        loadData()
    }
    
    func loadData() {
        Task {
            ProgressHUD.animate(interaction: false)
            do {
                sortedUsers = try await statisticsService.loadUsers()
                applySorting()
                ProgressHUD.dismiss()
            } catch {
                ProgressHUD.failed(error.localizedDescription)
            }
        }
    }
    
    func applySorting() {
        switch currentSort {
        case .rating:
            sortedUsers = sortedUsers.sorted { $0.nftCount > $1.nftCount }
        case .name:
            sortedUsers = sortedUsers.sorted { $0.name < $1.name }
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
