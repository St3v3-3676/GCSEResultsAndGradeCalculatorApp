//
//  TabBarView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 03/03/2026.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            Spacer()
            
            TabView {
                TabBarItem(title: "Home", systemImage: "house.fill") {
                    HomeView()
                }
                
                TabBarItem(title: "Calculator", imageName: "calculate") {
                    GradeCalculatorView()
                }

            
                TabBarItem(title: "Boundaries", systemImage: "9.square.fill") {
                    GradeBoundaryView()
                }
                
                TabBarItem(title: "Results", systemImage: "chart.bar.fill") {
                    StudentResultsView()
                }
                
                TabBarItem(title: "Settings", systemImage: "gear") {
                    SettingsView()
                }
            }
            .tabViewStyle(.sidebarAdaptable)
            #if os(macOS)
            .toolbarBackground(.clear, for: .windowToolbar)
            #endif
            .toolbarTitleDisplayMode(.inline)
            .navigationTitle("Home")
        }
        .background(BackgroundView())
        .tint(.textColour)
    }
}

#Preview {
    TabBarView()
        .environment(AppSettingsViewModel())
}
