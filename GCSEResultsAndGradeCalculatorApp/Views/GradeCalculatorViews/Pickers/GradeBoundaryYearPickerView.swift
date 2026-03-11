//
//  GradeBoundaryYearPickerView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 10/03/2026.
//

import SwiftUI

import SwiftUI

struct GradeBoundaryYearPickerView: View {
    @Environment(GradeCalculatorViewModel.self) var gradeCalculatorViewModel
    
    
    private var boundaryYears: [String] { gradeCalculatorViewModel.getBoundaryYears() }
    
    var body: some View {
        @Bindable var model = gradeCalculatorViewModel
        VStack {
            SubTitleView(title: "Select a boundary year:")
            
            Picker("", selection: $model.selectedBoundaryYear) {
                ForEach(boundaryYears, id: \.self) { year in
                    Text(year).font(.title3).tag(year)
                    
                }
            }
            .tint(Color.primary)
            .pickerStyle(.menu)
        }
    }
}

#Preview {
    GradeBoundaryYearPickerView()
        .environment(GradeCalculatorViewModel())
}
