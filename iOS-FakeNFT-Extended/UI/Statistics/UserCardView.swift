//
//  UserCardView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import SwiftUI

struct UserCardView: View {
    let user: User
    let rank: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                HStack(spacing: 16) {
                    AsyncImage(
                        url: URL(string: user.avatar),
                        scale: 1.0,
                        transaction: .init(animation: .default)
                    ) { phase in
                        switch phase {
                        case .empty, .failure:
                            Image(systemName: defaultImg)
                                .clipShape(Circle())
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                        @unknown default:
                            Image(systemName: defaultImg)
                        }
                    }
                    .frame(width: 70, height: 70)
                    
                    Text(user.name)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.appBlack)
                    
                    Spacer(minLength: .zero)
                }
                .padding(.vertical, 20)
                
                if let description = user.description {
                    HStack(spacing: .zero) {
                        Text(description)
                            .font(.system(size: 13))
                            .foregroundColor(.appBlack)
                            .multilineTextAlignment(.leading)
                        
                        Spacer(minLength: .zero)
                    }
                }
                
                if let url = URL(string: user.website) {
                    NavigationLink {
                        WebView(url: url)
                    } label: {
                        Text("Перейти на сайт пользователя")
                            .font(.system(size: 15))
                            .foregroundColor(.appBlack)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .stroke(Color.appBlack, lineWidth: 1.0)
                    )
                    .padding(.top, 28)
                }
                
                NavigationLink {
                    NFTCollectionView(user: user)
                } label: {
                    HStack {
                        Text("Коллекция NFT (\(user.nftCount))")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.appBlack)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.appBlack)
                    }
                    .padding(.vertical, 16)
                }
                .padding(.top, 41)
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .background(Color.white)
        .navigationBarTitleDisplayMode(.inline)
    }
}
