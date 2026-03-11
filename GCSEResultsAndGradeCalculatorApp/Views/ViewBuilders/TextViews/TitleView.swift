//
//  TextTitleView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 26/02/2026.
//

import SwiftUI

struct TitleView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let title: String

    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TextTitle(title: title, font: .title)
        } else {
            TextTitle(title: title, font: .largeTitle)
        }
        #elseif os(macOS)
        TextTitle(title: title, font: .largeTitle)  
        #endif
    }
    
    @ViewBuilder
    func TextTitle(title: String, font: Font) -> some View {
        ShadowView {
            Text(title)
                .padding(15)
                .font(font)
                .foregroundStyle(.foreground)
                .background(RoundedRectangle(cornerRadius: 5, style: .continuous).glassEffect().foregroundStyle(.clear))
        }
    }
}

#Preview {
    TitleView(title: "Test")
}
