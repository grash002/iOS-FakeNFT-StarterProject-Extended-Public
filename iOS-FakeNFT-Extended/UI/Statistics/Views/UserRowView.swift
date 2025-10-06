//
//  UserRowView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Yana Silosieva on 01.10.2025.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    let rank: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(rank)")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.appBlack)
                .frame(width: 27)
            
            HStack(spacing: 8) {
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
                            .frame(width: 28, height: 28)
                    @unknown default:
                        Image(systemName: defaultImg)
                    }
                }
                .frame(width: 28, height: 28)
                
                Text(user.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.appBlack)
                
                Spacer()
                
                Text("\(user.nftCount)")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.appBlack)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 26)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.appLightGray)
            )
        }
    }
}

let defaultImg = "person.circle.fill"
