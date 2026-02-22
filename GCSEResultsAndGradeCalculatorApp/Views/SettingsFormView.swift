import SwiftUI
import LocalAuthentication

struct SettingsFormView: View {
    @Environment(AppSettingsViewModel.self) private var settings
    @Binding var showAuthFailedAlert: Bool
    @Binding var pendingFaceIDValue: Bool?
    let confirmChangingFaceID: (Bool) async -> Void

    var body: some View {
        Form {
            Section("Security") {
                Toggle(isOn: Binding(
                    get: { settings.useFaceID },
                    set: { newValue in
                        if newValue != settings.useFaceID {
                            pendingFaceIDValue = newValue
                            Task { await confirmChangingFaceID(newValue) }
                        }
                    }
                )) {
                    Text("Use Face ID")
                }
                Text("If disabled, you can still unlock with your PIN.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Section("Appearance") {
                Toggle(isOn: Binding(
                    get: { settings.appTheme == .system },
                    set: { newValue in
                        if newValue {
                            settings.appTheme = .system
                        } else {
                            // When leaving system, default to dark for a clear manual state
                            if settings.appTheme == .system { settings.appTheme = .light }
                        }
                    }
                )) {
                    Text("Match System Appearance")
                }
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
