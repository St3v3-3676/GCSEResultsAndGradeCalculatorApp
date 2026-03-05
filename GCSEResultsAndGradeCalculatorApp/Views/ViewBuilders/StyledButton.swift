//
//  ButtonViewBuilderView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct StyledButton: View {
    
    var buttonLabel: String
    var isLandscape: Bool
    var title: String
    var buttonImageName: String
    var width: CGFloat
    var action: () -> Void
    
    
    // ViewBuilder-based label factory
    @ViewBuilder
    func buttonLabel(title: String, systemImage: String, isLandscape: Bool) -> some View {
        

        Image(systemName: systemImage)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .lineLimit(nil) // allow wrapping
//            .minimumScaleFactor(0.8) // don’t scale down; prefer wrapping
            .fixedSize(horizontal: false, vertical: true) // grow vertically if needed

        
        Text(title)
            .font(.title2)
            .multilineTextAlignment(.center)
            .lineLimit(nil) // allow wrapping
//            .minimumScaleFactor(0.8) // don’t scale down; prefer wrapping
            .fixedSize(horizontal: false, vertical: true) // grow vertically if needed

    }
    var body: some View {
        Button(action: action) {
            buttonLabel(title: title, systemImage: buttonImageName, isLandscape: isLandscape)
        }
        .frame(width: width)
        .buttonStyle(.glass)
        .shadow(color: .shadowColour, radius: ViewLayoutModel.shadowRadius, x: ViewLayoutModel.shadowXOffset, y: ViewLayoutModel.shadowYOffset)
    }
}

#Preview {
    StyledButton(
        buttonLabel: "Test",
        isLandscape: false,
        title: "Preview",
        buttonImageName: "house",
        width: 400,
        action: {}
        
    )
}

