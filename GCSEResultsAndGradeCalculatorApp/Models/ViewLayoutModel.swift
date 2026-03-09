//
//  ViewLayoutModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import Foundation
import SwiftUI

/// A struct that defines layout constants and helper functions for view styling and sizing across different platforms and orientations.
struct ViewLayoutModel {
//
//    static var isAccessibilitySize: Bool {
//        #if os(iOS)
//        let category = UIApplication.shared.preferredContentSizeCategory
//        return category.isAccessibilityCategory
//        #elseif os(macOS)
//        // SwiftUI Environment isn't available here; default to false for macOS unless passed in by a View.
//        return false
//        #else
//        return false
//        #endif
//    }
    
    static func setSecuritySettingsPosition(isLandscape: Bool) -> [CGFloat] {
        var position: [CGFloat] = []
        
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            position.append(2)
            position.append(2)
            
            return position
        }else if !isLandscape && device == .phone {
            position.append(2)
            position.append(2)
            
            return position
        }

        if isLandscape && device == .pad {
            position.append(2)
            position.append(2)
            
            return position
        } else if !isLandscape && device == .pad {
            position.append(2)
            position.append(2)
            
            return position
        }

// Default scale for any other iOS cases
        position.append(2)
        position.append(2)
        return position
        #endif

        #if os(macOS)
        position.append(2)
        position.append(2)
        return position
        #endif
    }
}

