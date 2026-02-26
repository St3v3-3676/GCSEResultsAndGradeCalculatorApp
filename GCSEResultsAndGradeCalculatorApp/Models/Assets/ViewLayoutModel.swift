//
//  ViewLayoutModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import Foundation
import SwiftUI

struct ViewLayoutModel {
    static let cornerRadius: CGFloat = 10
    static let buttonHeight: CGFloat = 50
    static let shadowRadius: CGFloat = 10
    static let shadowXOffset: CGFloat = -10
    static let shadowYOffset: CGFloat = 10
    
    
    enum fontSize {
        static let titleFont: Font = .largeTitle.bold()
        static let buttonFont: Font = .largeTitle.weight(.heavy)
    }
    
    enum SignInViewBackgroundStyle {
        static let width: Int = 2
        static let height: Int = 2
        static let points: [SIMD2<Float>] = [
            SIMD2<Float>(0.0, 0.0),SIMD2<Float>(1.0, 0.0),
            SIMD2<Float>(0.0,1.0), SIMD2<Float>(1.0,1.0)]
        static let colours: [Color] = [.textColour, .textColour,
                                       .white, .white]
    }
    
    static func getAppleButtonPaddingValue(isLandscape: Bool) -> CGFloat {
#if os(iOS)
        if isLandscape {
            return 100
        } else {
            return 0
        }
#endif
        
        return 0
    }
    
    static func getSignInWithAppleButtonWidth(isLandscape: Bool) -> CGFloat {
#if os(iOS)
        
        if isLandscape {
            return 4
        } else {
            return 0.5
        }
#endif
        
        return 200
    }
    
    static func getSignInWithAppleButtonHeight(isLandscape: Bool) -> CGFloat {
#if os(iOS)
        
        if isLandscape {
            return 10
        } else {
            return 0.1
        }
#endif
        
        return 80
    }
    
    static func setButtonScale(isLandscape: Bool) -> CGFloat {
#if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 1.5
        }else if !isLandscape && device == .phone {
            return 1
        }
        
        if isLandscape && device == .pad {
            return 1.5
        } else if !isLandscape && device == .pad {
            return 0.5
        }
#endif
        
        return 1
    }
    
    static func setSignInWithAppleButtonSize(isLandscape: Bool, width: CGFloat, height: CGFloat) -> CGFloat {
#if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        
        
#endif
        return 400
        
    }
}
