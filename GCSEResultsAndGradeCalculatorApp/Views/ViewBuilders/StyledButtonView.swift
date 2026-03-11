//
//  ButtonViewBuilderView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct StyledButtonView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var buttonLabel: String
    var isLandscape: Bool
    var title: String
    var buttonImageName: String
    var width: CGFloat
    var height: CGFloat
    var action: () -> Void
    
    
    // ViewBuilder-based label factory
    @ViewBuilder
    func buttonLabel(title: String, systemImage: String, isLandscape: Bool) -> some View {
        
        
        Image(systemName: systemImage)
            .font(.title.bold())
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
        
        
        Text(title)
            .font(.title2)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true) // grow vertically if needed
        
    }
    var body: some View {
        ShadowView {
            Button(action: action) {
                buttonLabel(title: title, systemImage: buttonImageName, isLandscape: isLandscape)
            }
            .frame(width: width, height: height)
            .buttonStyle(.glass)
            .foregroundStyle(.primary)
        }
    }
}
#Preview {
    StyledButtonView(
        buttonLabel: "Test",
        isLandscape: false,
        title: "Preview",
        buttonImageName: "house",
        width: 400,
        height: 50,
        action: {}
        
    )
}

