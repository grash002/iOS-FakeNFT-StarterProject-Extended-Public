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
                .frame(width: 27, alignment: .center)
            
            HStack(spacing: 8) {
                Image(systemName: user.avatar)
                    .font(.system(size: 28))
                    .foregroundColor(.gray)
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
                    .fill(.userRow)
            )
        }
    }
}
