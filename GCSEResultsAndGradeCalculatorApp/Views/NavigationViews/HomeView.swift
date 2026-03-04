//
//  TabBarView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home")
            
        }
    }
}

#Preview {
    HomeView()
        .environment(AppSettingsViewModel())
        .environment(AuthenticationViewModel())
}

