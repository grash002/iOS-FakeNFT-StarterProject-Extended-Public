//
//  NftCardView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Иван Иван on 31.08.2025.
//

import SwiftUI

struct NftCardView: View {
    
    // MARK: - Public Properties
    @ObservedObject var model: NftCardViewModel
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            mainPicture
            ratingStars
            footer
        }
        .frame(maxWidth: 108)
    }
    private var mainPicture: some View {
        ZStack(alignment: .topTrailing) {
            nftImage
            heartButton
        }
    }
    private var nftImage: some View {
        Image(model.nft.images.first ?? "")
            .resizable()
            .scaledToFit()
            .frame(width: 108, height: 108)
            .cornerRadius(12)
    }
    private var heartButton: some View {
        Button {
            withAnimation(.spring()) {
                model.isFavorite.toggle()
            }
        } label: {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 21, height: 21)
                .foregroundStyle(model.isFavorite ? Color(uiColor: UIColor.yaRed) : Color(uiColor: UIColor.yaWhite))
                .padding(10)
        }
    }
    private var ratingStars: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { index in
                Button {
                    withAnimation(.easeInOut) {
                        model.rating = index
                    }
                } label: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundStyle(index <= model.rating ? Color(uiColor: UIColor.yaYellow) :
                                            Color(uiColor: UIColor.yaLightGrayLight))
                        .frame(width: 12, height: 12)
                }
                .buttonStyle(.plain)
            }
        }
    }
    private var nameAndPrice: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.nft.name)
                .font(Font(UIFont.bodyBold))
            
            Text("\(model.nft.price.description) ETH")
                .font(Font(UIFont.caption3))
        }
    }
    private var buyButton: some View {
        Button {
            withAnimation(.spring()) {
                model.isBuy.toggle()
            }
        } label: {
            Image(model.isBuy ? .selectedCart : .cart)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        }
    }
    private var footer: some View {
        HStack {
            nameAndPrice
            Spacer()
            buyButton
        }
    }
}



// MARK: - Preview
#Preview {
    let nft = NftItemModel.mockData[0]
    let model = NftCardViewModel(nft: nft)
    NftCardView(model: model)
}
