//
//  SubjectAndBoundaryPickerView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 10/03/2026.
//

import SwiftUI

struct SubjectAndBoundaryPickerView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
#if os(iOS)
        VStack {
            if horizontalSizeClass == .compact {
                VStack {
                    SubjectPickerView()
                    
                    GradeBoundaryYearPickerView()
                }
                
            } else if horizontalSizeClass == .regular {
                HStack {
                    ExamBoardPickerView()
                    
                    GradeBoundaryYearPickerView()
                        .padding(.leading)
                }
                .padding(.bottom)
                
                HStack {
                    SubjectPickerView()
                        .padding(.leading)
                }
            }
        }
        
#elseif os(macOS)
        HStack {
            SubjectPickerView()
                .padding(.trailing)
            GradeBoundaryYearPickerView()
        }
#endif
    }
}

#Preview {
    SubjectAndBoundaryPickerView()
        .environment(GradeCalculatorViewModel())
}
