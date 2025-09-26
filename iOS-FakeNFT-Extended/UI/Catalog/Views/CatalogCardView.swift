import SwiftUI
import Kingfisher

struct CatalogCardView: View {
    
    // MARK: - Public properties
    let item: CatalogItemModel
    var title: String { "\(item.name) (\(item.nfts.count))" }
    
    // MARK: - Views
    var body: some View {
        VStack {
            // Заменяем Image на KFImage для загрузки по URL
            if let imageUrl = URL(string: item.cover) {
                KFImage(imageUrl)
                    .resizable()
                    .placeholder {
                        ProgressView()
                            .frame(height: 140)
                    }
                    .onFailure { error in
                        print("Failed to load image: \(error)")
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 140, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .clipped()
                    .cornerRadius(12)
            } else {
                Image(item.cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 140, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .clipped()
                    .cornerRadius(12)
                    .foregroundColor(.gray)
            }
            
            Text(title)
                .font(Font(UIFont.bodyBold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: - Preview
#Preview {
    CatalogCardView(item: CatalogItemModel.mockData[1])
}
