//
//  TabBarView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            GradeCalculatorViews()
                .tabItem {
                    Label("Grade Calculator", systemImage: "plus.forwardslash.minus")
                }
                .fontWeight(.bold)
            
            GradeBoundaryView()
                .tabItem {
                    Label("Grade Boundaries", systemImage: "9.square.fill")
                }
            
            StudentResultsView()
                .tabItem {
                    Label("Student Results", systemImage: "graduationcap.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .tabBarMinimizeBehavior(.automatic)
        .tabViewStyle(.sidebarAdaptable)
        
        
    }
}

#Preview {
    TabBarView()
        .environment(AppSettingsViewModel())
        .environment(AuthenticationViewModel())
}
