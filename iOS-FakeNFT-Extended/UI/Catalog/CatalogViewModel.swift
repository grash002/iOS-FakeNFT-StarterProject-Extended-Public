import Foundation

final class CatalogViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var items = CatalogItemModel.mockData
    @Published var selectedSort = SortOptions.byCountNft
    @Published var selectedItem: CatalogItemModel?
    @Published var showSortDialog: Bool = false
    
    // MARK: - Private Properties
    private let storage = SettingStorage()
    
    // MARK: - Initializers
    init() {
        getCatalogItems()
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
    private func getCatalogItems() {
        //TODO: Connect with api
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
