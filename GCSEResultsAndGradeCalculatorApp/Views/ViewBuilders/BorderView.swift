//
//  BorderView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 10/03/2026.
//

import SwiftUI

struct BorderView<Content: View>: View {
    let borderColour: Color
    let borderWidth: CGFloat
    private let content: () -> Content

    init(borderColour: Color = .primary, borderWidth: CGFloat = 2, @ViewBuilder content: @escaping () -> Content) {
        self.borderColour = borderColour
        self.borderWidth = borderWidth
        self.content = content
    }

    var body: some View {
        content()
            .border(borderColour, width: borderWidth)
    }
}

#Preview {
    BorderView(borderColour: .primary, borderWidth: 2) {
        VStack {
            Text("Preview content")
        }
        .padding()
    }
}
