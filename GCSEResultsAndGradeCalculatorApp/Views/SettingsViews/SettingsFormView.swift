import SwiftUI
import LocalAuthentication

struct SettingsFormView: View {
    @Environment(AppSettingsViewModel.self) private var settings
    @AppStorage("appColorScheme") private var appColorScheme: String = "system" // "light", "dark", or "system"
    
    var body: some View {
        #if os(iOS)
        Form {
            Section("Security") {
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                    
                    
                } label: {
                    HStack {
                        Image(systemName: "gear")
                        Text("Open Settings")
                    }
                }
                
                Text("To turn Face ID off, open Settings > Face ID & Passcode and disable Face ID for your device or for this app.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Section("Appearance") {
                Picker("Appearance", selection: $appColorScheme) {
                    Text("System").tag("system")
                    Text("Light").tag("light")
                    Text("Dark").tag("dark")
                }
                .pickerStyle(.segmented)
                .glassEffect()
                
            }
        }
        #endif
        
    }
}



#Preview {
    SettingsFormView()
        .environment(AppSettingsViewModel())
}
