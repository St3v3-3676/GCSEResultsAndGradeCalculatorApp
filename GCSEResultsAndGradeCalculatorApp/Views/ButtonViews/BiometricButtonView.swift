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
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        let biometricButtonScale: [CGFloat] = getBiometricButtonScale(isLandscape: isLandscape)
        
        ErrorMessage()
        
        StyledButton(
            buttonLabel: authenticationViewModel.biometryLabel,
            isLandscape: isLandscape,
            title: authenticationViewModel.biometryLabel,
            buttonImageName: authenticationViewModel.biometryImageName,
            width: width * biometricButtonScale[0],
            height: height * biometricButtonScale[1],
            action: {
                Task { await authenticationViewModel.attemptUnlock() }
            }
            
        )
        
        BiometricsUnavailableMessage()
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
    
    func getBiometricButtonScale(isLandscape: Bool) -> [CGFloat] {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return isLandscape ? [0.4,0.2] : [0.8,2]
        } else if device == .pad {
            return isLandscape ? [0.6,0.08] : [0.6,0.06]

        } else {
            return [2,1]
        }
        #endif
        
        #if os(macOS)
        return [2,1]
        #endif
    }
}


