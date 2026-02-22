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
                    Text("Welcome")
                        .font(ViewLayoutModel.fontSize.titleFont)
                        
                    BiometricButtonView(isLandscape: isLandscape)
 
                }
                .position(x: width / ViewLayoutModel.setButtonPosition(isLandscape: isLandscape).xPosDivider, y: height / ViewLayoutModel.setButtonPosition(isLandscape: isLandscape).yPosDivider)
                
            } else {
                //LogoView()
                if isLandscape {
                    HStack {
                        LogoView(isLandscape: isLandscape)
                        SignInButtonView(isLandscape: isLandscape)
                            
                    }
                    .position(x: width / 2, y: height / 2)
                } else {
                    VStack {
                        LogoView(isLandscape: isLandscape)
                        SignInButtonView(isLandscape: isLandscape)
                    }
                    .position(x: width / 2, y: height / 2)

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

