import Foundation

final class CatalogViewModel: ObservableObject {
    @Published var items = CatalogItemModel.mockData
    @Published var selectedSort = SortOptions.byCountNft
    private let storage = SettingStorage()
    
    init() {
        getCatalogItems()
        getSetting()
        sortItems(by: selectedSort)
    }
    
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
