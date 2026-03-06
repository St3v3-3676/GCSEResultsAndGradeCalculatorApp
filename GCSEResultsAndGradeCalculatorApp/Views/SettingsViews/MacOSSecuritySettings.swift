//
//  MacOSSecuritySettings.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 06/03/2026.
//

import SwiftUI
import LocalAuthentication

struct MacOSSecuritySettingsView: View {
    @AppStorage("useBiometricAuth") private var useBiometricAuth: Bool = true
    @AppStorage("developerMode") private var developerMode: Bool = false
    @State private var biometricAvailable: Bool = false
    @State private var authAlert: (show: Bool, title: String, message: String) = (false, "", "")
    
    var body: some View {
        #if os(macOS)
        VStack(alignment: .leading) {
            HStack {
                Text("App Security")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                Image(systemName: "lock.open.fill")
                    .font(.title2)
                    .foregroundStyle(.textColour)
            }
            .padding(.horizontal, 10)
            
            // Biometric toggle (Touch ID on macOS)
            Toggle(isOn: $useBiometricAuth) {
                Label {
                    Text("Use Touch ID")
                } icon: {
                    Image(systemName: "touchid")
                }
            }
            .toggleStyle(.switch)
            .padding(.horizontal, 10)

            Text("Require Touch ID to unlock sensitive areas of the app.")
                .foregroundStyle(.secondary)
                .font(.callout)
                .padding(.horizontal, 10)
            
            // Developer Mode toggle to show testing controls
            Toggle(isOn: $developerMode) {
                Label {
                    Text("Developer Mode")
                } icon: {
                    Image(systemName: "wrench.and.screwdriver")
                }
            }
            .padding(.horizontal, 10)
            
            if developerMode {
                Button {
                    Task {
                        await testBiometricAuthentication()
                    }
                } label: {
                    Label("Test Touch ID", systemImage: "touchid")
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 10)
                .disabled(!biometricAvailable || !useBiometricAuth)
            }

            Spacer()
        }
        .task {
            let context = LAContext()
            var error: NSError?
            // Biometrics available (Touch ID hardware + enrolled)
            let bioCapable = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
            biometricAvailable = bioCapable
        }
        .alert(authAlert.title, isPresented: $authAlert.show) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(authAlert.message)
        }
        #endif
    }
    
    private func testBiometricAuthentication() async {
        let context = LAContext()
        let reason = "Authenticate to continue."

        var authSucceeded = false

        // Try biometrics first
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            do {
                authSucceeded = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            } catch {
                // If biometrics fail (e.g., not enrolled), try deviceOwnerAuthentication as a fallback
                authSucceeded = await evaluateDeviceOwnerAuthentication(with: reason)
            }
        } else {
            // Biometrics not available or not enrolled; fall back to passcode
            authSucceeded = await evaluateDeviceOwnerAuthentication(with: reason)
        }

        await MainActor.run {
            if authSucceeded {
                authAlert = (true, "Authentication Succeeded", "Authentication was successful.")
            } else {
                authAlert = (true, "Authentication Failed", "Authentication did not succeed.")
            }
        }
    }
    
    private func evaluateDeviceOwnerAuthentication(with reason: String) async -> Bool {
        let context = LAContext()
        do {
            let success = try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason)
            return success
        } catch {
            return false
        }
    }
}

#Preview {
    MacOSSecuritySettingsView()
        .frame(width: 300, height: 200)
}
