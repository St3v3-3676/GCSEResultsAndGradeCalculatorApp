//
//  LogoView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct LogoView: View {
    var isLandscape: Bool
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var body: some View {
        Image("AppLogo")
            .resizable()
            .frame(width: imageWidth, height: imageHeight)
            .shadow(color: .shadowColour, radius: 50)
    }
}

#Preview {
    LogoView(isLandscape: false, imageWidth: 100, imageHeight: 100)
}
