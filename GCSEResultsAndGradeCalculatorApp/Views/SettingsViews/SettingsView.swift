import SwiftUI

struct SettingsView: View {
    @Environment(AppSettingsViewModel.self) private var settings
    
    @AppStorage("appColourScheme") var appColourScheme: String = "light"

    var body: some View {
        NavigationStack {
            SettingsFormView()
                .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppSettingsViewModel())
}
