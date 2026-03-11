//
//  SubHeadingView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 10/03/2026.
//

import SwiftUI

struct SubTitleView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let title: String
    
    var body: some View {

        SubTitle(title: title, font: .title.bold())
    }
    
    @ViewBuilder
    func SubTitle(title: String, font: Font) -> some View {

        Text(title)
            .padding(10)
            .font(font)
            .foregroundStyle(.foreground)
    }
}

#Preview {
    SubTitleView(title: "Test")
}
