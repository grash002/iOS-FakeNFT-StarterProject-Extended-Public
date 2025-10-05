import Foundation

struct Setting {
    var value: String
    var settingKey: SettingsKey
}

enum SettingsKey: String {
    case sortingMethod
}
