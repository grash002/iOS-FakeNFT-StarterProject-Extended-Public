//
//  NFTCollectionView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 03.10.2025.
//

import SwiftUI

struct NFTCollectionView: View {
    @StateObject private var viewModel: NFTCollectionViewModel
    @State private var likedItems: Set<String> = []
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: NFTCollectionViewModel(user: user))
    }
    
    private let itemWidth: CGFloat = 108
    private let spacing: CGFloat = 8
    private let horizontalPadding: CGFloat = 16
    
    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width - horizontalPadding * 2
            let columnsCount = max(Int(availableWidth / (itemWidth + spacing)), 1)
            let columns = Array(repeating: GridItem(.flexible(), spacing: spacing), count: columnsCount)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.ntfs, id: \.id) { nft in
                        NFTCardView(nft: nft, isLiked: likedItems.contains(nft.id)) {
                            if likedItems.contains(nft.id) {
                                likedItems.remove(nft.id)
                            } else {
                                likedItems.insert(nft.id)
                            }
                        }
                        .frame(maxWidth: itemWidth)
                    }
                }
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.top, 20)
        }
        .background(Color.white)
        .navigationTitle("Коллекция NFT")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - NFT Card View
struct NFTCardView: View {
    let nft: Nft
    let isLiked: Bool
    let onLikeTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                
                if let img = nft.images.first {
                    AsyncImage(url: img) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 108, height: 108)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 108, height: 108)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                    
                Button {
                    onLikeTap()
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 18, height: 16)
                        .foregroundColor(isLiked ? .red : .white)
                        .padding(12)
                }
            }
            
            VStack(spacing: 4) {
                HStack(spacing: 2) {
                    ForEach(0..<5) { index in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(index < nft.rating ? .starYellow : .appLightGray)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    VStack(spacing: 4) {
                        HStack {
                            Text(nft.name)
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.appBlack)
                                .lineLimit(2)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text(String(nft.price) + " ETH")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.appBlack)
                            
                            Spacer()
                        }
                    }
                    
                    Spacer(minLength: .zero)
                    
                    Button {
                        // Add to cart
                    } label: {
                        Image(.basket)
                    }
                    .padding(.trailing, 12)
                }
            }
            .padding(.bottom, 20)
        }
    }
}
