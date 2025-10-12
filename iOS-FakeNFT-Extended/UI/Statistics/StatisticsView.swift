//
//  StatisticsView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject private var viewModel = StatisticsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(Array(viewModel.sortedUsers.enumerated()), id: \.element.id) { index, user in
                    NavigationLink {
                        UserCardView(user: user, rank: index + 1)
                    } label: {
                        UserRowView(user: user, rank: index + 1)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.showSortSheet = true
                } label: {
                    Image(.sortButtonIcon)
                        .foregroundColor(.black)
                }
            }
        }
        .confirmationDialog("Сортировка", isPresented: $viewModel.showSortSheet) {
            Button("По имени") { viewModel.sortByName() }
            Button("По рейтингу") { viewModel.sortByRating() }
            Button("Закрыть", role: .cancel) { }
        } message: {
            Text("Сортировка")
        }
    }
}
