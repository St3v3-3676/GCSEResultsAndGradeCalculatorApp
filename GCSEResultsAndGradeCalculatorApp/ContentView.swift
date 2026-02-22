//
//  ContentView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthenticationViewModel.self) private var authenticationViewModel

    var body: some View {
        Group {
            if authenticationViewModel.isAuthorized {
                TabBarView()
            } else {
                SignInView()
            }
        }
        .animation(.easeInOut(duration: 0.25), value: authenticationViewModel.isAuthorized)
    }
}

#Preview {
    ContentView()
        .environment(AuthenticationViewModel())
}
