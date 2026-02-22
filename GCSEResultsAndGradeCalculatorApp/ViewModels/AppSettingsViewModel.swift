import SwiftUI
import Combine
import Observation

enum AppTheme: String, CaseIterable, Identifiable {
    case system
    case light
    case dark

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .system: return "System"
        case .light: return "Light"
        case .dark:  return "Dark"
        }
    }
}

@Observable
final class AppSettingsViewModel {
    private enum Keys {
        static let useFaceID = "useFaceID"
        static let appTheme = "appTheme"
    }

    private let defaults: UserDefaults

    // Stored properties so Observation can track changes and update views
    var useFaceID: Bool {
        didSet { defaults.set(useFaceID, forKey: Keys.useFaceID) }
    }

    var appThemeRaw: String {
        didSet { defaults.set(appThemeRaw, forKey: Keys.appTheme) }
    }

    var appTheme: AppTheme {
        get { AppTheme(rawValue: appThemeRaw) ?? .system }
        set { appThemeRaw = newValue.rawValue }
    }

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        // Load from defaults or apply sensible defaults
        if let storedUseFaceID = defaults.object(forKey: Keys.useFaceID) as? Bool {
            self.useFaceID = storedUseFaceID
        } else {
            self.useFaceID = true
            defaults.set(true, forKey: Keys.useFaceID)
        }

        if let storedTheme = defaults.string(forKey: Keys.appTheme) {
            self.appThemeRaw = storedTheme
        } else {
            self.appThemeRaw = AppTheme.system.rawValue
            defaults.set(self.appThemeRaw, forKey: Keys.appTheme)
        }
    }
}

