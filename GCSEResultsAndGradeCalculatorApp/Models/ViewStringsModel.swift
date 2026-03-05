//
//  ViewStringsModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 22/02/2026.
//

import Foundation
import SwiftUI

struct ViewStringsModel {
    enum systemImageName {
        static let homeImage: String = "house.fill"
        static let gradeBoundariesImage: String = "9.square.fill"
        static let studentResultsImage: String = "chart.bar.fill"
        static let settingsImage: String = "gear"
    }
    
    static func getTabTitles() -> [String]{
        var tabTitles:[String] = []
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        if device == .phone {
            tabTitles.append("Home")
            tabTitles.append("Calculator")
            tabTitles.append("Boundaries")
            tabTitles.append("Results")
            tabTitles.append("Settings")
 
        } else if device == .pad {
            tabTitles.append("Home")
            tabTitles.append("Grade Calculator")
            tabTitles.append("Grade Boundaries")
            tabTitles.append("Student Results")
            tabTitles.append("Settings")
        }
        #endif
        
        #if os(macOS)
        tabTitles.append("Home")
        tabTitles.append("Grade Calculator")
        tabTitles.append("Grade Boundaries")
        tabTitles.append("Student Results")
        tabTitles.append("Settings")
        #endif
        
        return tabTitles
    }
}
