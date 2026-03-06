//
//  SwiftUIView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 06/03/2026.
//

import SwiftUI

struct MacOSSettingsView: View {
    var body: some View {
        TabView {
            Tab("Appearance", systemImage: "paintpalette.fill") {
                MacOSAppearanceSettingsView()
            }
            
            Tab("Security", systemImage: "lock.shield.fill") {
                // Replace with MacOSSecuritySettingsView() when available
                MacOSSecuritySettingsView()
            }
        }
        .frame(width: 300, height: 200)
    }
}

#Preview {
    MacOSSettingsView()
        .environment(AppSettingsViewModel())
}
