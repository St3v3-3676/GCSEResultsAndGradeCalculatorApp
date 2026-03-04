//
//  SideBarItem.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 03/03/2026.
//

import SwiftUI

struct SideBarItem<Content: View>: View {
    // Use names instead of Image values to avoid needing optionals for concrete types
    let title: String
    let textFont: Font
    let imageFont: Font
    let systemImageName: String?
    let imageName: String?
    let content: Content

    init(imageName: String, title: String, textFont: Font, imageFont: Font, @ViewBuilder content: () -> Content) {
        self.imageName = imageName
        self.systemImageName = nil
        self.title = title
        self.textFont = textFont
        self.imageFont = imageFont
        self.content = content()
    }

    init(systemImageName: String, title: String, textFont: Font, imageFont: Font, @ViewBuilder content: () -> Content) {
        self.systemImageName = systemImageName
        self.imageName = nil
        self.title = title
        self.textFont = textFont
        self.imageFont = imageFont
        self.content = content()
    }

    var body: some View {
        HStack(spacing: 8) {
            if let systemName = systemImageName {
                NavigationLink {
                    content
                } label: {
                    Image(systemName: systemName)
                        .font(imageFont)
                        .foregroundStyle(.textColour)
                        .backgroundStyle(.clear)
                    Text(title)
                        .font(textFont)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .foregroundStyle(.textColour)
                        .backgroundStyle(.clear)
                }
  
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                
            } else if let name = imageName {
                NavigationLink {
                    content
                } label: {
                    Image(name)
                        .renderingMode(.original)
                        .font(imageFont)
                    Text(title)
                        .font(textFont)
                }
            }
        }
    }
}
