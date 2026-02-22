//
//  File.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//
import SwiftUI

struct BiometricButtonView: View {
    @Environment(AuthenticationViewModel.self) private var authenticationViewModel
    
    let isLandscape: Bool

    var body: some View {
        VStack {
            ErrorMessage()
            
            StyledButtonView(
                buttonLabel: authenticationViewModel.biometryLabel,
                isLandscape: isLandscape,
                title: authenticationViewModel.biometryLabel,
                buttonImageName: authenticationViewModel.biometryImageName,
                action: {
                    Task { await authenticationViewModel.attemptUnlock() }
                }
            )
            
            BiometricsUnavailableMessage()
        }
    }
    
    @ViewBuilder
    private func ErrorMessage() -> some View {
        if let errorMessage = authenticationViewModel.errorMessage {
            Text(errorMessage)
                .font(.footnote)
                .foregroundStyle(.red)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func BiometricsUnavailableMessage() -> some View {
        if !authenticationViewModel.hasBiometrics {
            Text(authenticationViewModel.biometryUnavailableMessage)
                .font(.footnote)
                .foregroundStyle(.secondary)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    BiometricButtonView(isLandscape: false)
        .environment(AuthenticationViewModel())
}
