//
//  ButtonViewBuilderView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct StyledButtonView: View {
    var buttonLabel: String
    var isLandscape: Bool
    var title: String
    var buttonImageName: String
    var action: () -> Void
    
    // Reusable primary button style
    struct PrimaryButtonStyle: ButtonStyle {
        let isLandscape: Bool

        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background(
                    RoundedRectangle(cornerRadius: ViewLayoutModel.cornerRadius, style: .continuous)
                        .foregroundStyle(.clear)
                )
                .animation(.easeInOut(duration: 0.12), value: configuration.isPressed)
        }
    }

    // ViewBuilder-based label factory
    @ViewBuilder
    func buttonLabel(title: String, systemImage: String, isLandscape: Bool) -> some View {
            HStack {
                Image(systemName: systemImage)

                Text(title)
            }
    }
    var body: some View {
        Button(action: action) {
            buttonLabel(title: title, systemImage: buttonImageName, isLandscape: isLandscape)
        }
        .scaleEffect(ViewLayoutModel.setButtonScale(isLandscape: isLandscape))
        .buttonStyle(.glass)
        .shadow(color: .textColour, radius: ViewLayoutModel.shadowRadius, x: ViewLayoutModel.shadowXOffset, y: ViewLayoutModel.shadowYOffset)
    }  
}

#Preview {
    StyledButtonView(buttonLabel: "Test", isLandscape: false, title: "Preview", buttonImageName: "home") {
    }
}
