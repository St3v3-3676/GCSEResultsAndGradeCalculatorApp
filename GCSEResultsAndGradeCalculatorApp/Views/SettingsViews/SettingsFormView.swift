import SwiftUI
import LocalAuthentication

struct SettingsFormView: View {
    @Environment(AppSettingsViewModel.self) private var settings
    @AppStorage("appColorScheme") private var appColorScheme: String = "system" // "light", "dark", or "system"
    @Binding var showAuthFailedAlert: Bool
    @Binding var pendingFaceIDValue: Bool?
    let confirmChangingFaceID: (Bool) async -> Void

    var body: some View {
        Form {
            Section("Security") {
                Button {
                    #if os(iOS)
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                    #endif
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
        .alert("Authentication Failed", isPresented: $showAuthFailedAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Face ID verification is required to change this setting.")
        }
    }
}

#Preview {
    @Previewable @State var showAuthFailedAlert = false
    @Previewable @State var pendingFaceIDValue: Bool? = nil

    return SettingsFormView(
        showAuthFailedAlert: $showAuthFailedAlert,
        pendingFaceIDValue: $pendingFaceIDValue,
        confirmChangingFaceID: { _ in }
    )
    .environment(AppSettingsViewModel())
}
