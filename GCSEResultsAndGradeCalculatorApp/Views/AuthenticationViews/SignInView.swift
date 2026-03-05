//
//  SignInView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//
import Foundation
import SwiftUI

struct SignInView: View {
    @Environment(AuthenticationViewModel.self) private var authenticationViewModel
 
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let isLandscape = width > height

            if authenticationViewModel.isAppleIDConfigured {
                ZStack {
                    LogoView(
                        isLandscape: isLandscape,
                        imageWidth: width / ViewLayoutModel.getLogoSize(isLandscape: isLandscape),
                        imageHeight: width / ViewLayoutModel.getLogoSize(isLandscape: isLandscape))
                        .position(
                            x: width / ViewLayoutModel.setLogoXPosition(isLandscape: isLandscape),
                            y: height / ViewLayoutModel.setLogoYPosition(isLandscape: isLandscape))
        
                    BiometricButtonView(
                        isLandscape: isLandscape,
                        width: width * ViewLayoutModel.setBiometricButtonWidthScale(isLandscape: isLandscape))
                        .position(
                            x: width / ViewLayoutModel.setBiometricButtonXPosition(isLandscape: isLandscape),
                            y: height / ViewLayoutModel.setBiometricButtonYPosition(isLandscape: isLandscape))

                }
                .background(BackgroundView())
            } else {
                if isLandscape {
                    ZStack {
                        LogoView(
                            isLandscape: isLandscape,
                            imageWidth: width / ViewLayoutModel.getLogoSize(isLandscape: isLandscape),
                            imageHeight: width / ViewLayoutModel.getLogoSize(isLandscape: isLandscape))
                            .position(
                                x: width / ViewLayoutModel.setLogoXPosition(isLandscape: isLandscape),
                                y: height / ViewLayoutModel.setLogoYPosition(isLandscape: isLandscape))
                        
                        SignInButtonView(
                            isLandscape: isLandscape,
                            width: width * ViewLayoutModel.setButtonWidthScale(isLandscape: isLandscape),
                            height: height * ViewLayoutModel.setButtonHeightScale(isLandscape: isLandscape))
                            .position(
                            x: width / ViewLayoutModel.setAppleButtonXPosition(isLandscape: isLandscape),
                            y: height / ViewLayoutModel.setAppleButtonYPosition(isLandscape: isLandscape))
                    }
                    .background(BackgroundView())
                } else {
                    ZStack {
                        BackgroundView()
                        
                        LogoView(
                            isLandscape: isLandscape,
                            imageWidth: width / ViewLayoutModel.getLogoSize(isLandscape: isLandscape),
                            imageHeight: width / ViewLayoutModel.getLogoSize(isLandscape: isLandscape))
                            .position(
                                x: width / ViewLayoutModel.setLogoXPosition(isLandscape: isLandscape),
                                y: height / ViewLayoutModel.setLogoYPosition(isLandscape: isLandscape))
                        
                        SignInButtonView(
                            isLandscape: isLandscape,
                            width: width * ViewLayoutModel.setButtonWidthScale(isLandscape: isLandscape),
                            height: height * ViewLayoutModel.setButtonHeightScale(isLandscape: isLandscape))
                            .position(
                                x: width / ViewLayoutModel.setAppleButtonXPosition(isLandscape: isLandscape),
                                y: height / ViewLayoutModel.setAppleButtonYPosition(isLandscape: isLandscape))
                    }
                }
            }
        }
    }
}

#Preview("Portrait - Biometric") {
    let vm = AuthenticationViewModel()
    vm.isPreview = true
    vm.isAppleIDConfigured = true
    return SignInView()
        .environment(vm)
        
}

#Preview("Landscape - Biometric") {
    let vm = AuthenticationViewModel()
    vm.isPreview = true
    vm.isAppleIDConfigured = true
    return SignInView()
        .environment(vm)
}
#Preview("Portrait - Apple Sign In") {
    let vm = AuthenticationViewModel()
    vm.isPreview = true
    vm.isAppleIDConfigured = false
    return SignInView()
        .environment(vm)
}

#Preview("Biometric Error State") {
    let vm = AuthenticationViewModel()
    vm.isPreview = true
    vm.isAppleIDConfigured = true
    vm.errorMessage = "Authentication failed"
    return SignInView()
        .environment(vm)
}


