//
//  SignInView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//
import SwiftUI

struct SignInView: View {
    @Environment(AuthenticationViewModel.self) private var auth

    var body: some View {
        Group {
            if auth.isAuthorized {
                ContentView()
            } else {
                VStack(spacing: 24) {
                    Text("Welcome")
                        .font(.largeTitle.weight(.bold))

                    if auth.isAppleIDConfigured {
                        BiometricUnlockView()
                    } else {
                        
                        SignInWithAppleView(
                            onRequest: auth.onRequest,
                            onCompletion: auth.onCompletion
                        )
                    }
                }
                .padding()
            }
        }
        .transition(.opacity.combined(with: .scale(scale: 0.98)))
        .animation(.easeInOut(duration: 0.25), value: auth.isAuthorized)
        .task {
            auth.startAutoSignIn()
        }
    }
    
}
