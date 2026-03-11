//
//  DividerView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 10/03/2026.
//

import SwiftUI

struct DividerView: View {
    
    let width: CGFloat
    let height: CGFloat
    let color: Color = .primary
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 0)
                .frame(width: width, height: height)
                .foregroundStyle(color)
        }
    }
}

#Preview {
    DividerView(width: 200, height: 2)
}
