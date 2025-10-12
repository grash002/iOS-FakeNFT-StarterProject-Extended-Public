import Foundation

final class CatalogViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var items: [CatalogItemModel] = []
    @Published var selectedSort = SortOptions.byCountNft
    @Published var selectedItem: CatalogItemModel?
    @Published var showSortDialog: Bool = false
    @Published var state = ViewState.default
    
    // MARK: - Private Properties
    private let storage = SettingStorage()
    
    @MainActor
    private lazy var nftService = NftServiceImpl.shared
    
    // MARK: - Initializers
    init() {
        Task {
            await getCatalogItems()
        }
        getSetting()
        sortItems(by: selectedSort)
    }
    
    // MARK: - Public Methods
    func sortItems(by options: SortOptions) {
        selectedSort = options
        saveSetting()
        switch options {
        case .byName:
            items.sort { $0.name < $1.name }
        case .byCountNft:
            items.sort { $0.nfts.count > $1.nfts.count }
        }
    }
    
    // MARK: - Private Methods
    @MainActor
    private func getCatalogItems() async {
        do {
            state = .loading
            let collections = try await nftService.loadCollections()
            self.items = collections
            state = .success
        }
        catch(let error) {
            state = .failed
            print("Failed to load. \r\nError: \(error.localizedDescription)")
        }
    }
    private func getSetting() {
        if let sortedString = storage.getSetting(key: SettingsKey.sortingMethod.rawValue) {
            selectedSort = SortOptions(rawValue: sortedString) ?? .byCountNft
        }
    }
    private func saveSetting() {
        let setting = Setting(value: selectedSort.rawValue, settingKey: SettingsKey.sortingMethod)
        storage.saveSetting(setting)
    }
}
