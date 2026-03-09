//
//  AppShadow.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 09/03/2026.
//

import SwiftUI

/// A reusable container that applies the app's shadow styling to its content.
struct Shadow<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            // Key shadow styling used across the app
            .shadow(color: Color.black.opacity(colorScheme == .dark ? 0.5 : 0.15),
                    radius: colorScheme == .dark ? 12 : 10,
                    x: 0, y: colorScheme == .dark ? 6 : 8)
    }
}

#Preview("AppShadow") {
    Shadow {
        RoundedRectangle(cornerRadius: 16)
            .fill(.background)
            .frame(width: 200, height: 120)
            .overlay(
                VStack(spacing: 8) {
                    Image(systemName: "graduationcap.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.tint)
                    Text("Shadow Preview")
                        .font(.headline)
                        .foregroundStyle(.primary)
                }
            )
            .padding()
    }
}
