//
//  SubjectPickerView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 09/03/2026.
//

import SwiftUI

struct SubjectPickerView: View {
    @Environment(GradeCalculatorViewModel.self) var gradeCalculatorViewModel
    
    private var subjects: [String] { gradeCalculatorViewModel.getSubjects() }
    
    var body: some View {
        @Bindable var model = gradeCalculatorViewModel
        
        VStack {
            SubTitleView(title: "Select a subject:")
            
            Picker("", selection: $model.selectedSubject) {
                ForEach(subjects, id: \.self) { subject in
                    Text(subject).font(.title3).tag(subject)
                    
                }
            }
            .tint(Color.primary)
            .pickerStyle(.menu)
        }
    }
}

#Preview {
    SubjectPickerView()
        .environment(GradeCalculatorViewModel())
}
