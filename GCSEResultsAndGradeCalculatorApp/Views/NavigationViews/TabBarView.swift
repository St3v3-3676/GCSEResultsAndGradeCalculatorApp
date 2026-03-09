//
//  TabBarView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 03/03/2026.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        let tabTitles = ViewStringsModel.getTabTitles()
        ZStack {
            Spacer()
            TabView {
                TabBarItem(title: tabTitles[0], systemImage: ViewStringsModel.systemImageName.homeImage) {
                    HomeView()
                }
                
                TabBarItem(title: tabTitles[1], imageName: "calculate") {
                    GradeCalculatorView()
                }

            
                TabBarItem(title: tabTitles[2], systemImage: ViewStringsModel.systemImageName.gradeBoundariesImage) {
                    GradeBoundaryView()
                }
                
                TabBarItem(title: tabTitles[3], systemImage: ViewStringsModel.systemImageName.studentResultsImage) {
                    StudentResultsView()
                }
                #if os(iOS)
                TabBarItem(title: tabTitles[4], systemImage: ViewStringsModel.systemImageName.settingsImage) {
                    SettingsView()
                }
                #endif
            }
            .tint(.black)
            .tabViewStyle(.sidebarAdaptable)
            #if os(macOS)
            .toolbarBackground(.clear, for: .windowToolbar)
            #endif
            .toolbarTitleDisplayMode(.inline)
            .navigationTitle("Home")
        }
        
    }
}

#Preview {
    TabBarView()
        .environment(AppSettingsViewModel())
}

