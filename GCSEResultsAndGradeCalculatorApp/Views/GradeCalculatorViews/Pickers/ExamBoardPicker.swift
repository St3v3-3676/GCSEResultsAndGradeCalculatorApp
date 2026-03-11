//
//  ExamBoardPicker.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 11/03/2026.
//

import SwiftUI

struct ExamBoardPickerView: View {
    @Environment(GradeCalculatorViewModel.self) var gradeCalculatorViewModel
    
    private var examBoards: [String] { gradeCalculatorViewModel.getExamBoards() }
    
    var body: some View {
        @Bindable var model = gradeCalculatorViewModel
        
        VStack {
            SubTitleView(title: "Select an exam Board:")
            
            Picker("", selection: $model.selectedExamBoard) {
                ForEach(examBoards, id: \.self) { examBoard in
                    Text(examBoard).font(.title3).tag(examBoard)
                    
                }
            }
            .tint(Color.primary)
            .pickerStyle(.menu)
        }
    }
}

#Preview {
    ExamBoardPickerView()
        .environment(GradeCalculatorViewModel())
}
