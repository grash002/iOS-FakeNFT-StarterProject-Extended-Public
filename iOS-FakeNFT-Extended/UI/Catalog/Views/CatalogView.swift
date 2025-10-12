import SwiftUI

struct CatalogView: View {
    
    // MARK: - Private properties
    @StateObject private var viewModel = CatalogViewModel()
    
    // MARK: - Views
    var body: some View {
        VStack(spacing: 20) {
            sortHeader
            mainScroll
        }
        .confirmationDialog("Sort.title",
                            isPresented: $viewModel.showSortDialog,
                            titleVisibility: .visible) {
            Button(LocalizedStringKey("Sort.ByName")) {
                viewModel.sortItems(by: .byName)
            }
            Button(LocalizedStringKey("Sort.ByCountNft")) {
                viewModel.sortItems(by: .byCountNft)
            }
        }
                            .fullScreenCover(item: $viewModel.selectedItem) { item in
                                let model = CatalogDetailViewModel(item: item)
                                CatalogDetailView(model: model)
                            }
                            .viewState($viewModel.state)
    }
    private var sortHeader: some View {
        HStack {
            Spacer()
            sortButton
        }
        .padding(.horizontal, 16)
    }
    private var sortButton: some View {
        Button {
            viewModel.showSortDialog.toggle()
        } label : {
            Image(.sort)
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)
        }
    }
    private var mainScroll: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.items) { item in
                    Button {
                        viewModel.selectedItem = item
                    } label : {
                        CatalogCardView(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Preview
#Preview {
    CatalogView()
}
