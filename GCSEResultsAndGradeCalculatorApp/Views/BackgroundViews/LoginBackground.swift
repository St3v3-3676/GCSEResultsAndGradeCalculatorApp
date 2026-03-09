//
//  BackgroundView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 22/02/2026.
//

import SwiftUI

struct LoginBackground: View {
    @State private var isAnimating = false
    @Environment(\.colorScheme) private var colorScheme
    
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    
    #if os(iOS)
    private var high: Double { colorScheme == .dark ? 0.18 : 0.60 }
    private var low: Double  { colorScheme == .dark ? 0.01 : 0.008 }
    #elseif os(macOS)
    private var high: Double { colorScheme == .dark ? 0.8:0.7}
    private var low: Double  { colorScheme == .dark ? 0.0:0.0}
    #endif
    
    var body: some View {
        VStack {
            #if os(iOS)
            MeshGradient(
                width: 2,
                height: 2,
                points: [[0, 0], [1, 0],
                         [0, isAnimating ? 0.5:1], [1, isAnimating ? 0.5:1]
                ],
                colors: [
                    Color(.systemIndigo).opacity(high), Color(.systemIndigo).opacity(high),
                    Color(.systemIndigo).opacity(low), Color(.systemIndigo).opacity(low),
                ]
            )
            #elseif os(macOS)
            MeshGradient(
                width: 2,
                height: 2,
                points: [[0, 0], [1, 0],
                         [0, isAnimating ? 0.5:1], [1, isAnimating ? 0.5:1]
                ],
                colors: [
                    Color(.systemIndigo).opacity(high), Color(.systemIndigo).opacity(high),
                    Color(.systemIndigo).opacity(low), Color(.systemIndigo).opacity(low),
                ]
            )
            #endif
        }
        .background(.background)
        .ignoresSafeArea()
        .onAppear {
            guard !reduceMotion else { return }
            withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    LoginBackground()
}
