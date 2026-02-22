import SwiftUI
import LocalAuthentication

struct SettingsView: View {
    @Environment(AppSettingsViewModel.self) private var settings
    @State private var showAuthFailedAlert = false
    @State private var pendingFaceIDValue: Bool? = nil

    var body: some View {
        NavigationStack {
            SettingsFormView(
                showAuthFailedAlert: $showAuthFailedAlert,
                pendingFaceIDValue: $pendingFaceIDValue,
                confirmChangingFaceID: { newValue in
                    await confirmChangingFaceID(to: newValue)
                }
            )
            .navigationTitle("Settings")
        }
    }

    private func confirmChangingFaceID(to newValue: Bool) async {
        let context = LAContext()
        let reason = newValue
            ? "Confirm with Face ID to enable biometric unlock"
            : "Confirm with Face ID to disable biometric unlock"
        do {
            let ok = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            await MainActor.run {
                if ok {
                    if let value = pendingFaceIDValue { settings.useFaceID = value }
                } else {
                    showAuthFailedAlert = true
                }
                pendingFaceIDValue = nil
            }
        } catch {
            await MainActor.run {
                showAuthFailedAlert = true
                pendingFaceIDValue = nil
            }
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppSettingsViewModel())
}
