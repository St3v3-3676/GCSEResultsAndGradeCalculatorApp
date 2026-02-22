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
    
    struct PositionDivider {
        let xPosDivider: CGFloat
        let yPosDivider: CGFloat
    }
    
    enum fontSize {
        static let titleFont: Font = .largeTitle.bold()
        static let buttonFont: Font = .largeTitle.weight(.heavy)
    }

    static func setButtonScale(isLandscape: Bool) -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return 1.5
        }
        
        if !isLandscape && device == .phone {
            return 1
        }

        return 0.5
        #endif
        
        #if os(macOS)
        return 0.5
        #endif
    }

    static func setButtonPosition(isLandscape: Bool) -> PositionDivider {
#if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        if isLandscape && device == .phone {
            return PositionDivider(xPosDivider: 1.5, yPosDivider: 2)
        }
        
        if !isLandscape && device == .phone {
            return PositionDivider(xPosDivider: 2, yPosDivider: 2)
        }

        return PositionDivider(xPosDivider: 2.0, yPosDivider: 2)
#endif
        #if os(macOS)
        return PositionDivider(xPosDivider: 2.0, yPosDivider: 2)
        #endif
    }

    static func setImageSize(isLandscape: Bool) -> CGFloat {
#if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        if isLandscape && device == .phone {
            return 200
        } else if !isLandscape && device == .phone {
            return 210
        }
        
        if isLandscape && device == .pad {
            return 200
        } else if !isLandscape && device == .pad {
            return 210
        }

        return 0.4
#endif
        #if os(macOS)
        return 0.5
        #endif
    }

    static func setImagePosition(isLandscape: Bool) -> PositionDivider {
#if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        if isLandscape && device == .phone {
            return PositionDivider(xPosDivider: 2.8, yPosDivider: 1.4)
        }

        return PositionDivider(xPosDivider: 2.0, yPosDivider: 3.0)
#endif
        #if os(macOS)
        return PositionDivider(xPosDivider: 2.0, yPosDivider: 3.0)
        #endif
    }
}
