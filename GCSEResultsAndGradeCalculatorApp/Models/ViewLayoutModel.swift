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

    static var isAccessibilitySize: Bool {
        #if os(iOS)
        let category = UIApplication.shared.preferredContentSizeCategory
        return category.isAccessibilityCategory
        #elseif os(macOS)
        // SwiftUI Environment isn't available here; default to false for macOS unless passed in by a View.
        return false
        #else
        return false
        #endif
    }
    
    
    /// Shadow-related layout values such as corner radius and shadow offsets.
    static let cornerRadius: CGFloat = 10
    static let buttonHeight: CGFloat = 50
    static let shadowRadius: CGFloat = 10
    static let shadowXOffset: CGFloat = -10
    static let shadowYOffset: CGFloat = 10
    
    /// Font styles used throughout the app, including title and button fonts.
    static let titleFont: Font = .largeTitle.bold()
    static let buttonFont: Font = .largeTitle.weight(.heavy)
    
    /// Mesh gradient configuration values including width, height, control points, and colors.
    static let width: Int = 2
    static let height: Int = 2
    static let points: [SIMD2<Float>] = [
        SIMD2<Float>(0.0, 0.0),SIMD2<Float>(1.0, 0.0),
        SIMD2<Float>(0.0,1.0), SIMD2<Float>(1.0,1.0)]
    static let colours: [Color] = [.textColour, .textColour,
                                   .white, .white]
    
    static func getLogoSize(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 3
        } else if !isLandscape && device == .phone {
            return 1.8
        }
        
        if isLandscape && device == .pad {
            return 2.5
        } else if !isLandscape && device == .pad {
            return 2
        }
        
        return 2
        
        #endif
        
        #if os(macOS)
        return 3
        #endif
    }
    
    static func setButtonWidthScale(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 0.2
        } else if !isLandscape && device == .phone {
            return 0.4
        }
        
        if isLandscape && device == .pad {
            return 0.2
        } else if !isLandscape && device == .pad {
            return 0.4
        }
        
        return 2
        
        #endif
        
        #if os(macOS)
        return 0.2
        #endif
    }
    
    static func setButtonHeightScale(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 0.12
        }else if !isLandscape && device == .phone {
            return 0.06
        }
        
        if isLandscape && device == .pad {
            return 0.08
        } else if !isLandscape && device == .pad {
            return 0.06
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 0.08
        #endif
    }
    
    static func setAppleButtonXPosition(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 1.5
        }else if !isLandscape && device == .phone {
            return 2
        }
        
        if isLandscape && device == .pad {
            return 1.5
        } else if !isLandscape && device == .pad {
            return 2
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 2
        #endif
    }
    
    static func setAppleButtonYPosition(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 2
        }else if !isLandscape && device == .phone {
            return 1.6
        }
        
        if isLandscape && device == .pad {
            return 2
        } else if !isLandscape && device == .pad {
            return 1.6
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 1.4
        #endif
    }
    
    static func setBiometricButtonYPosition(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 1.8
        }else if !isLandscape && device == .phone {
            return 1.8
        }
        
        if isLandscape && device == .pad {
            return 2
        } else if !isLandscape && device == .pad {
            return 1.6
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 1.7
        #endif
    }
    static func setBiometricButtonXPosition(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 1.5
        }else if !isLandscape && device == .phone {
            return 2
        }
        
        if isLandscape && device == .pad {
            return 1.5
        } else if !isLandscape && device == .pad {
            return 2
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 2
        #endif
    }
    
    static func setLogoXPosition(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 3.4
        }else if !isLandscape && device == .phone {
            return 2
        }
        
        if isLandscape && device == .pad {
            return 3
        } else if !isLandscape && device == .pad {
            return 2
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 2
        #endif
    }
    
    static func setLogoYPosition(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 2
        }else if !isLandscape && device == .phone {
            return 2.7
        }
        
        if isLandscape && device == .pad {
            return 2
        } else if !isLandscape && device == .pad {
            return 2.5
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 2.9
        #endif
    }
    
    static func setBiometricButtonWidthScale(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 0.4
        } else if !isLandscape && device == .phone {
            return 0.8
        }
        
        if isLandscape && device == .pad {
            return 0.6
        } else if !isLandscape && device == .pad {
            return 0.6
        }
        
        return 2
        
        #endif
        
        #if os(macOS)
        return 2
        #endif
    }
    
    static func setBiometricButtonHeightScale(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 2
        }else if !isLandscape && device == .phone {
            return 2
        }
        
        if isLandscape && device == .pad {
            return 0.08
        } else if !isLandscape && device == .pad {
            return 0.06
        }
        
        // Default scale for any other iOS cases
        return 1
        #endif
        
        #if os(macOS)
        return 1
        #endif
    }
    
    static func setButtonFont() -> Font {
        var font: Font = .largeTitle
        #if os(iOS)
        let category = UIApplication.shared.preferredContentSizeCategory
        if category.isAccessibilityCategory {
            font = .caption2
            return font
        } else {
            return font
        }
        #endif
        
        #if os(macOS)
        return .largeTitle
        #endif
    }
}

