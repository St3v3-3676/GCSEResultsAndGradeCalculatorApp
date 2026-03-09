//
//  GradeCalculatorViews.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 26/02/2026.
//

import SwiftUI

struct GradeCalculatorView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleView(title: "Grade Calculator")
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.07)
            }
            .background(ViewBackground())
        }
    }
}

#Preview {
    GradeCalculatorView()
}
