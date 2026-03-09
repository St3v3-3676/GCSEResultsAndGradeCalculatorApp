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
            let logoPosition = getLogoPosition(isLandscape: isLandscape)
            let appleButtonPosition = getAppleButtonPosition(isLandscape: isLandscape)
            
            if authenticationViewModel.isAppleIDConfigured {
                ZStack {
                    LogoView()
                    .position(
                        x: width / logoPosition[0],
                        y: height / logoPosition[1])
                    
                    BiometricButtonView(
                        isLandscape: isLandscape, width: width, height: height)
                    .position(
                        x: width / getBiometricButtonPosition(isLandscape: isLandscape)[0],
                        y: height / getBiometricButtonPosition(isLandscape: isLandscape)[1])
                    
                }
                .background(LoginBackground())
            } else {
                    ZStack {
                        LogoView()
                        .position(
                            x: width / logoPosition[0],
                            y: height / logoPosition[1])
                        
                        SignInButtonView(
                            isLandscape: isLandscape,
                            width: width,
                            height: height)
                        .position(
                            x: width / appleButtonPosition[0],
                            y: height / appleButtonPosition[1])
                    }
                    .background(LoginBackground())
            }
        }
    }
    
    func getBiometricButtonPosition(isLandscape: Bool) -> [CGFloat] {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            return isLandscape ? [1.5,1.8] : [2,1.65]
        } else if device == .pad {
            return isLandscape ? [1.5,2] : [2,1.6]
        } else {
            return [1.5,1.8]
        }
        #endif
        
        #if os(macOS)
        let biometricButtonPosition: [CGFloat] = [2,1.7]
        return biometricButtonPosition
        #endif
    }
    
    func getLogoPosition(isLandscape: Bool) -> [CGFloat] {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            return isLandscape ? [3.4,2] : [2,2.5]
        } else if device == .pad {
            return isLandscape ? [3,2] : [2,2.5]
        } else {
            return [1,1.4]
        }
        #endif
        
        #if os(macOS)
        return [2,2.5]
        #endif
    }
        
    func getAppleButtonPosition(isLandscape: Bool) -> [CGFloat] {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            return isLandscape ? [1.5,2] : [2,1.6]
        }else if device == .pad {
            return isLandscape ? [1.5,2] : [2,1.6]
        } else {
            return isLandscape ? [1.5,2] : [2,1.6]
        }
        #endif
        
        #if os(macOS)
        return [2,1.4]
        #endif
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


