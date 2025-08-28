import SwiftUI

struct CatalogView: View {
    @StateObject private var viewModel = CatalogViewModel()
    @State var showSortDialog = false
    
    var body: some View {
        VStack(spacing: 20) {
            sortHeader
            mainScroll
        }
        .padding(.horizontal, 16)
        .confirmationDialog("Sort.title",
                            isPresented: $showSortDialog,
                            titleVisibility: .visible) {
            Button(LocalizedStringKey("Sort.ByName")) {
                viewModel.sortItems(by: .byName)
            }
            Button(LocalizedStringKey("Sort.ByCountNft")) {
                viewModel.sortItems(by: .byCountNft)
            }
        }
    }
    var sortHeader: some View {
        HStack {
            Spacer()
            sortButton
        }
    }
    var sortButton: some View {
        Button {
            showSortDialog.toggle()
        } label : {
            Image("Sort")
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)
        }
    }
    var mainScroll: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.items) { item in
                    CatalogCardView(item: item)
                }
            }
        }
    }
}

#Preview {
    CatalogView()
}
