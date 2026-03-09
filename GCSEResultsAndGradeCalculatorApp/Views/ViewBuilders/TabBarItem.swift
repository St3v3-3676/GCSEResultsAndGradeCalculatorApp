//
//  TabBarItemView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 03/03/2026.
//

import SwiftUI

struct TabBarItem<Content: View>: View {
    let title: String
    let systemImageName: String?
    let imageName: String?
    let isSystemImage: Bool
    let content: Content

    init(title: String, systemImage: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.systemImageName = systemImage
        self.imageName = nil
        self.isSystemImage = true
        self.content = content()
    }

    init(title: String, imageName: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.systemImageName = nil
        self.imageName = imageName
        self.isSystemImage = false
        self.content = content()
    }

    var body: some View {
        content
            .tabItem {
                if isSystemImage, let systemImageName {

                    Label(
                        title,
                        systemImage: systemImageName)
                    .frame(maxWidth: .infinity)
                    .tint(.black)
                        
                } else if let imageName {
                    Label(title, image: imageName)
                        .tint(Color(.black))
            }
                    
        }
    }
}

#Preview {
    TabBarItem(title: "Results", systemImage: "chart.bar.fill") {
        Text("Results Content")
    }
}
