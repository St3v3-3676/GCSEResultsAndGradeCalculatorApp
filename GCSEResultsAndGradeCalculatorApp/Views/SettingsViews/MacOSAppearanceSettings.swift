//
//  MacOSAppearanceSettings.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 06/03/2026.
//

import SwiftUI

struct MacOSAppearanceSettingsView: View {
    @AppStorage("appColorScheme") private var appColorScheme: String = "system"
    
    var body: some View {
        #if os(macOS)
        VStack(alignment: .leading) {
            HStack {
                Text("App Theme")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Image(systemName: "paintpalette.fill")
                    .font(.title2)
                    .foregroundStyle(.textColour)
            }
            .padding(.bottom)
 
            
            Text("Toggle the apps appearance between \n light and dark mode:")
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding(.bottom)


            
            
            Picker("",selection: $appColorScheme) {
                Text("Light").tag("light")
                    .font(.headline)
                
                Text("Dark").tag("dark")
                    .font(.headline)
            }
            .pickerStyle(.radioGroup)
            
            Spacer()
        }
        .padding(.leading, -26)
        #endif
    }
}
#Preview {
    MacOSAppearanceSettingsView()
        .frame(width: 300, height: 200)
}
