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
            Text(title)
                .padding(10)
                .font(.title)
                .foregroundStyle(.textColour)
                .background(RoundedRectangle(cornerRadius: 10).glassEffect().foregroundStyle(.clear))
                .shadow(color: .textColour, radius: ViewLayoutModel.shadowRadius, x: ViewLayoutModel.shadowXOffset, y: ViewLayoutModel.shadowYOffset)
        } else {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(.textColour)
                .shadow(color: .textColour, radius: ViewLayoutModel.shadowRadius, x: ViewLayoutModel.shadowXOffset, y: ViewLayoutModel.shadowYOffset)
        }
        #elseif os(macOS)
        Text(title)
            .font(.largeTitle)
            .foregroundStyle(.textColour)
            .shadow(color: .textColour, radius: ViewLayoutModel.shadowRadius, x: ViewLayoutModel.shadowXOffset, y: ViewLayoutModel.shadowYOffset)
        #endif
    }
    
    @ViewBuilder
    func TextTitle(title: String) -> some View {
        
        
    }
}

#Preview {
    TitleView(title: "Test")
}
