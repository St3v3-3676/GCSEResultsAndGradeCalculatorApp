//
//  TextView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 10/03/2026.
//

import SwiftUI

struct TextView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let text: String
    
    var body: some View {

        TextLine(text: text, font: .title)
    }
    
    @ViewBuilder
    func TextLine(text: String, font: Font) -> some View {
        Text(text)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .padding(10)
            .font(font)
            .foregroundStyle(.foreground)
    }
}

#Preview {
    TextView(text: "Test")
}
