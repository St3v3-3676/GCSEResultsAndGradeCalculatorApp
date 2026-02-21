//
//  ViewLayoutModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import Foundation
import SwiftUI

struct ViewLayoutModel {
    struct PositionDivider {
        let xPosDivider: CGFloat
        let yPosDivider: CGFloat
    }

    static func setButtonSize(isLandscape: Bool) -> CGSize {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if isLandscape && device == .phone {
            return CGSize(width: 200, height: 50)
        }
        
        if !isLandscape && device == .phone {
            return CGSize(width: 200, height: 50)
        }

        return CGSize(width: 280, height: 50)
        #endif
        
        #if os(macOS)
        return CGSize(width: 280, height: 50)
        #endif
    }

    static func setButtonPosition(isLandscape: Bool) -> PositionDivider {
#if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        if isLandscape && device == .phone {
            return PositionDivider(xPosDivider: 2, yPosDivider: 2)
        }
        
        if !isLandscape && device == .phone {
            return PositionDivider(xPosDivider: 2, yPosDivider: 8)
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
            return 0.35
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
