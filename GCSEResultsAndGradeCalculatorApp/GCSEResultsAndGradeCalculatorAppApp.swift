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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authenticationViewModel)
                .environment(appSettingsViewModel)
        }
        .windowResizability(.automatic)
     //   #if os(macOS)
        .defaultSize(width: 900, height: 900)
    //#endif
//        .defaultWindowPlacement { content, context in
//                    let displayBounds = context.defaultDisplay.visibleRect
//                    let size = content.sizeThatFits(.infinity)
//                    let verticalOffset: CGFloat = 140
//                    
//                    // The system places the window 140 points from the bottom of the screen.
//                    let position = CGPoint(
//                        x: displayBounds.midX - (size.width / 2),
//                        y: displayBounds.maxY - size.height - verticalOffset)
//            return WindowPlacement(position, size: size)
//        }

    }
}
