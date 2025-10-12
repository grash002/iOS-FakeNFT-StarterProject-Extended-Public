//
//  CollectionView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 29.08.2025.
//

import SwiftUI

struct CatalogDetailView: View {
    // MARK: - Public properties
    @ObservedObject var model: CatalogDetailViewModel
    
    // MARK: - Private properties
    @Environment(\.dismiss) private var dismiss
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    VStack(spacing: 16) {
                        imageCover
                        textBlock
                            .padding(.top, -geometry.safeAreaInsets.top)
                        nftGrid
                        Spacer()
                    }
                    backButton
                }
            }
        }
        .viewState($model.state)
    }
    private var nftGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(model.nfts, id: \.self) { item in
                    let model = NftCardViewModel(nft: item)
                    NftCardView(model: model)
                }
            }
        }
    }
    private var textBlock: some View {
        VStack(spacing: 8) {
            Text(model.item.name)
                .font(Font(UIFont.headline3))
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                HStack{
                    Text("\(NSLocalizedString("CatalogDetail.author", comment: "")):")
                    NavigationLink(model.item.author) {
                        if let url = URL(string: "https://yandex.ru/legal/practicum_termsofuse"){
                            WebView(url: url)
                                .ignoresSafeArea()
                        }
                    }
                    .foregroundStyle(.blue)
                    .underline()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(model.item.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(Font(UIFont.caption2))
        }
        .padding(.horizontal, 16)
    }
    @ViewBuilder
    private var imageCover: some View {
        if let imageUrl = URL(string: model.item.cover) {
            AsyncImage(url: imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        )
                } else {
                    ProgressView()
                }
            }
            .cornerRadius(12)
            .ignoresSafeArea(edges: .top)
        } else {
            Image(model.item.cover)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .ignoresSafeArea(edges: .top)
        }
    }
    private var backButton: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(9)
    }
}

// MARK: - Preview
#Preview {
    let model = CatalogDetailViewModel(item: CatalogItemModel.mockData[0])
    CatalogDetailView(model: model)
}
