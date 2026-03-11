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
                TabBarItemView(title: tabTitles[0], systemImage: ViewStringsModel.systemImageName.homeImage) {
                    HomeView()
                }
                
                TabBarItemView(title: tabTitles[1], imageName: "calculate") {
                    GradeCalculatorView()
                }

            
                TabBarItemView(title: tabTitles[2], systemImage: ViewStringsModel.systemImageName.gradeBoundariesImage) {
                    GradeBoundaryView()
                }
                
                TabBarItemView(title: tabTitles[3], systemImage: ViewStringsModel.systemImageName.studentResultsImage) {
                    StudentResultsView()
                }
                #if os(iOS)
                TabBarItemView(title: tabTitles[4], systemImage: ViewStringsModel.systemImageName.settingsImage) {
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
        }
        
    }
}

#Preview {
    TabBarView()
        .environment(AppSettingsViewModel())
        .environment(GradeCalculatorViewModel())
}

