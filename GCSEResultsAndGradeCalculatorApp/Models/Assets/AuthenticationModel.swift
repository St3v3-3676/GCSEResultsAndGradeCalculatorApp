//
//  AuthenticationModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import Foundation

struct AuthenticationModel: Codable {
    enum BiometryTypeStrings {
        static let faceID = "Face ID"
        static let touchID = "Touch ID"
    }
    
    enum SignInWithAppleButtonSize {
        static let width: CGFloat = 200
        static let height: CGFloat = 50
    }
    
    
}
