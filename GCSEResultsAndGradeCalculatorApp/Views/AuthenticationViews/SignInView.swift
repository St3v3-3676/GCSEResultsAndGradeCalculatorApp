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
            let buttonHeightScale: CGFloat = ViewLayoutModel.setButtonHeightScale(isLandscape: isLandscape)
            let buttonWidthScale: CGFloat = ViewLayoutModel.setButtonWidthScale(isLandscape: isLandscape)
            let logoSizeScale: CGFloat = ViewLayoutModel.getLogoSize(isLandscape: isLandscape)
            let appleButtonXPosition: CGFloat = ViewLayoutModel.setAppleButtonXPosition(isLandscape: isLandscape)
            let appleButtonYPosition: CGFloat = ViewLayoutModel.setAppleButtonYPosition(isLandscape: isLandscape)
            let logoXPosition: CGFloat = ViewLayoutModel.setLogoXPosition(isLandscape: isLandscape)
            let logoYPosition: CGFloat = ViewLayoutModel.setLogoYPosition(isLandscape: isLandscape)

            
            if authenticationViewModel.isAppleIDConfigured {
                ZStack {
                    LogoView(isLandscape: isLandscape, imageWidth: width / logoSizeScale, imageHeight: width / logoSizeScale)
                        .position(x: width / logoXPosition, y: height / logoYPosition)
        
                    BiometricButtonView(isLandscape: isLandscape, width: width * 0.9)
                        .position(x: width / 2, y: height / 1.5)
                        .padding(.top)

                }
                .background(BackgroundView())
            } else {
                if isLandscape {
                    ZStack {
                        LogoView(isLandscape: isLandscape, imageWidth: width / logoSizeScale, imageHeight: width / logoSizeScale)
                            .position(x: width / logoXPosition, y: height / logoYPosition)
                        
                        SignInButtonView(isLandscape: isLandscape, width: width * buttonWidthScale, height: height * buttonHeightScale)
                        .position(x: width / appleButtonXPosition, y: height / appleButtonYPosition)
                    }
                    .background(BackgroundView())
                } else {
                    ZStack {
                        BackgroundView()
                        
                        LogoView(isLandscape: isLandscape, imageWidth: width / logoSizeScale, imageHeight: width / logoSizeScale)
                            .position(x: width / logoXPosition, y: height / logoYPosition)
                        
                        SignInButtonView(isLandscape: isLandscape, width: width * buttonWidthScale, height: height * buttonHeightScale)
                        .position(x: width / appleButtonXPosition, y: height / appleButtonYPosition)
                    }

                }
                    
            }
                
        }
        .animation(.easeInOut(duration: 0.25), value: authenticationViewModel.isAuthorized)
        .task {
            if !authenticationViewModel.isPreview {
                authenticationViewModel.startAutoSignIn()
            }
        }
    }
}

//#Preview("Portrait - Biometric") {
//    let vm = AuthenticationViewModel()
//    vm.isPreview = true
//    vm.isAppleIDConfigured = true
//    return SignInView()
//        .environment(vm)
//}
//
//#Preview("Landscape - Biometric") {
//    let vm = AuthenticationViewModel()
//    vm.isPreview = true
//    vm.isAppleIDConfigured = true
//    return SignInView()
//        .environment(vm)
//}
//#Preview("Portrait - Apple Sign In") {
//    let vm = AuthenticationViewModel()
//    vm.isPreview = true
//    vm.isAppleIDConfigured = false
//    return SignInView()
//        .environment(vm)
//}
//
//#Preview("Biometric Error State") {
//    let vm = AuthenticationViewModel()
//    vm.isPreview = true
//    vm.isAppleIDConfigured = true
//    vm.errorMessage = "Authentication failed"
//    return SignInView()
//        .environment(vm)
//}
//
