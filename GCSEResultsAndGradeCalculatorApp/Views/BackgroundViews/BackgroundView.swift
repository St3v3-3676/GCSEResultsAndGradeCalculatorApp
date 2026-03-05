//
//  BackgroundView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 22/02/2026.
//

import SwiftUI

struct BackgroundView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            MeshGradient(
                width: 2,
                height: 2,
                points: [[0, 0], [1, 0],
                         [0, isAnimating ? 0.4:1.5], [1, isAnimating ? 0.4:1.5]
                ],
                colors: [
                    .gradientMiddleColour, .gradientMiddleColour,
                    .gradientBottomColour, .gradientBottomColour
                ]
            )
        }
        .background(.gradientBottomColour)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 5.0).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    BackgroundView()
}
