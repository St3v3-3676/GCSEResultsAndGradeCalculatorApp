//
//  BackgroundView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 22/02/2026.
//

import SwiftUI

struct BackgroundView: View {
    @State var isAnimating = false
    
    var body: some View {
        VStack{
            MeshGradient(
                width: 3,
                height:3,
                points: [.init(0,0),.init(0.5,0),.init(1,0),
                         .init(0,0.5),.init(0.5,0.5),.init(1,0.5),
                         .init(0,1),.init(0.5,1),.init(1,1)],
                colors: [
                    .gradientMiddleColour, .gradientBottomColour, .gradientMiddleColour,
                    .gradientBottomColour, .gradientMiddleColour.opacity(0.5), .gradientBottomColour, .gradientMiddleColour, .gradientBottomColour, .gradientMiddleColour])
            .onAppear() {
                withAnimation(.easeIn(duration: 5.0).repeatForever(autoreverses: true)) {
                    isAnimating.toggle()
                }
            }
            
            
        }
        .background(Color.gradientBottomColour)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}

