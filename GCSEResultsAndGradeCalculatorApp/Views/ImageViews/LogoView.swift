//
//  LogoView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct LogoView: View {
    var isLandscape: Bool
    var imageScale: CGFloat
    
    var body: some View {
        Image("AppLogo")
            .resizable()
            .scaledToFit()
            .scaleEffect(imageScale)
            //.frame(width: ViewLayoutModel.setImageSize(isLandscape: isLandscape), height: ViewLayoutModel.setImageSize(isLandscape: isLandscape))
    }
}

#Preview {
    LogoView(isLandscape: false, imageScale: 0.5)
}
