import SwiftUI

struct CatalogCardView: View {
    let item: CatalogItemModel
    var title: String { "\(item.name) (\(item.nfts.count))" }
    
    var body: some View {
        VStack() {
            Image(item.cover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 140, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .top)
                .clipped()
                .cornerRadius(12)
            Text(title)
                .font(Font(UIFont.bodyBold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CatalogCardView(item: CatalogItemModel.mockData[1])
}
