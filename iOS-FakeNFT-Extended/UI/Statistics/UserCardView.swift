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
                    Image(systemName: user.avatar)
                        .resizable()
                        .frame(width: 70, height: 70)
                    
                    Text(user.name)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.appBlack)
                    
                    Spacer(minLength: .zero)
                }
                .padding(.vertical, 20)
                
                Text(user.bio)
                    .font(.system(size: 13))
                    .foregroundColor(.appBlack)
                    .multilineTextAlignment(.leading)
                
                Button {
                    // Website action
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
                
                Button {
                    // Collection action
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
