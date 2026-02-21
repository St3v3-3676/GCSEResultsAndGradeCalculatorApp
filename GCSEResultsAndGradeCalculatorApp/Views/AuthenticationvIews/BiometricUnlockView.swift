//
//  BiometricUnlockView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//
import SwiftUI

struct BiometricUnlockView: View {
    @Environment(AuthenticationViewModel.self) private var auth
    @State private var isAuthenticating = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 12) {
            if let errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }

            Button {
                Task { await attemptUnlock() }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: auth.biometryImageName)
                    Text(auth.biometryLabel)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
            }
            .buttonStyle(.borderedProminent)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .disabled(isAuthenticating || !auth.hasBiometrics)

            if !auth.hasBiometrics {
                Text(auth.biometryUnavailableMessage)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }

    @MainActor
    private func attemptUnlock() async {
        guard !isAuthenticating else { return }
        isAuthenticating = true
        let success = await auth.authenticateWithBiometrics()
        isAuthenticating = false
        if success {
            errorMessage = nil
            auth.isAuthorized = true
        } else {
            errorMessage = "Authentication failed"
        }
    }
}

#Preview {
    BiometricUnlockView()
        .environment(AuthenticationViewModel())
}
