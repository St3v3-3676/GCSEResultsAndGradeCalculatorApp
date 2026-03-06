//
//  GCSEResultsAndGradeCalculatorAppApp.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

@main
struct GCSEResultsAndGradeCalculatorAppApp: App {
    @State private var authenticationViewModel = AuthenticationViewModel()
    @State private var appSettingsViewModel = AppSettingsViewModel()
    @AppStorage("appColorScheme") private var appColorScheme: String = "system"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authenticationViewModel)
                .environment(appSettingsViewModel)
                .preferredColorScheme(
                    appColorScheme == "light" ? .light :
                    appColorScheme == "dark" ? .dark : nil
                )
        }
        #if os(macOS)
        .windowToolbarStyle(.unified)
        .windowResizability(.automatic)
        .defaultSize(width: 1000, height: 1000)
        #endif
        
        #if os(macOS)
        
        Settings {
            MacOSSettingsView()
                .environment(appSettingsViewModel)
        }
        .windowResizability(.automatic)
        
        
        #endif
    }
}
