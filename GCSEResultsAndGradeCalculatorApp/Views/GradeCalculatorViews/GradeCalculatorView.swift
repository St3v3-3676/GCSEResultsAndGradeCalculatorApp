//
//  GradeCalculatorViews.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 26/02/2026.
//

import SwiftUI


struct GradeCalculatorView: View {
    @Environment(GradeCalculatorViewModel.self) var gradeCalculatorViewModel
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        @Bindable var model = gradeCalculatorViewModel
        
        ScrollView {
            VStack {
                TitleView(title: "Grade Calculator")
                
                SubjectAndBoundaryPickerView()
                    .padding(.top, 40)
                
                SectionDivider()
                
                StudentDetailsView()
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ViewBackground())
    }
}

struct SectionDivider: View {
    var body: some View {
        GeometryReader { geometry in
            
            DividerView(width: geometry.size.width * 0.5, height: 2)
                .padding(.top)
                .position(x: geometry.size.width / 2)
        }
    }
}

#Preview {
    GradeCalculatorView()
        .environment(GradeCalculatorViewModel())
}

