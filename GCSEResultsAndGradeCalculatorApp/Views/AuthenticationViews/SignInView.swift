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
                VStack {
                    LogoView(isLandscape: isLandscape, imageScale: width / 2)
                    Text("Welcome")
                        .font(ViewLayoutModel.fontSize.titleFont)
                    
                    BiometricButtonView(isLandscape: isLandscape)
                }

            } else {
                if isLandscape {
                    ZStack {
                        LogoView(isLandscape: isLandscape, imageScale: height / width)
                            .position(x: width / 3.5, y: height / 2)

                        SignInButtonView(isLandscape: isLandscape, width: width / ViewLayoutModel.getSignInWithAppleButtonWidth(isLandscape: isLandscape), height: height / ViewLayoutModel.getSignInWithAppleButtonHeight(isLandscape: isLandscape))
                            .padding(.leading, ViewLayoutModel.getAppleButtonPaddingValue(isLandscape: isLandscape))
                            .position(x: width / 1.5, y: height / 2)
                    }
                    .background(BackgroundView())
                } else {
                    ZStack {
                        BackgroundView()
                        
                        LogoView(isLandscape: isLandscape, imageScale: width / height)
                            .position(x: width / 2, y: height / 3)

                        SignInButtonView(isLandscape: isLandscape, width: width * ViewLayoutModel.getSignInWithAppleButtonWidth(isLandscape: isLandscape),  height: width * ViewLayoutModel.getSignInWithAppleButtonHeight(isLandscape: isLandscape))
                            .padding(.bottom, ViewLayoutModel.getAppleButtonPaddingValue(isLandscape: isLandscape))
                            .position(x: width / 2, y: height / 1.6)
                    }
                    
                }
            }
                
        }
        
        .animation(.easeInOut(duration: 0.25), value: authenticationViewModel.isAuthorized)
        .task {
            authenticationViewModel.startAutoSignIn()
        }
    }
}

#Preview {
    SignInView()
        .environment(AuthenticationViewModel())
}

