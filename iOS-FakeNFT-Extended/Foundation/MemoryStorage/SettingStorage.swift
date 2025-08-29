import Foundation

final class SettingStorage {
    private let defaults = UserDefaults.standard
    
    func saveSetting(_ setting: Setting) {
        defaults.set(setting.value, forKey: setting.settingKey.rawValue)
    }
    func getSetting(key: String) -> String? {
        return defaults.object(forKey: key) as? String
    }
}
