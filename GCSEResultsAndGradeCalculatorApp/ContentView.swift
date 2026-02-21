//
//  ContentView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabBarView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(AuthenticationViewModel())
}
