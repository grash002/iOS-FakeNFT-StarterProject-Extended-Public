import SwiftUI

struct CatalogCardView: View {
    
    // MARK: - Public properties
    let item: CatalogItemModel
    var title: String { "\(item.name) (\(item.nfts.count))" }
    
    // MARK: - Views
    var body: some View {
        VStack {
            if let imageUrl = URL(string: item.cover) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 140)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 140, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .top)
                            .clipped()
                    case .failure:
                        ProgressView()
                            .frame(height: 140)
                    @unknown default:
                        EmptyView()
                    }
                }
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
