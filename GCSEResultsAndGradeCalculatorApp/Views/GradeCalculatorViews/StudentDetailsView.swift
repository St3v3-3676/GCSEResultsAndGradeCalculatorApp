//
//  StudentDetailsView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 11/03/2026.
//

import SwiftUI

struct StudentDetailsView: View {
    @Environment(GradeCalculatorViewModel.self) var gradeCalculatorViewModel
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var showingImporter = false
    @State private var importError: String?
    
    var numberOfStudents: Int {
        Int(gradeCalculatorViewModel.numberOfStudents) ?? 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            @Bindable var model = gradeCalculatorViewModel
            
            Group {
                #if os(iOS)
                if horizontalSizeClass == .compact {
                    List {
                        Button("Import CSV") { showingImporter = true }
                        
                        TextField("First name", text: $model.firstname)
                        TextField("Surname", text: $model.surname)
                        TextField("Class name", text: $model.clasname)
                        TextField("Target grade", text: $model.targetGrade)
                        
                        if let importError {
                            Text("Import failed: \(importError)").foregroundStyle(.red)
                        }
                        ForEach(gradeCalculatorViewModel.students) { s in
                            Text("\(s.firstName) \(s.surname) • \(s.className) • \(s.targetGrade)")
                        }
                    }
                } else {
                    VStack {
                        Button("Import CSV") { showingImporter = true }
                        
                        VStack {
                            TextField("No: of students", text: $model.numberOfStudents)
                                .glassEffect()
                                .background(.clear)
                                .frame(width: geometry.size.width / 4.6, height: 50)
                        }
                        
                        if let importError {
                            Text("Import failed: \(importError)").foregroundStyle(.red)
                        }
                        List(gradeCalculatorViewModel.students) { s in
                            Text("\(s.firstName) \(s.surname) • \(s.className) • \(s.targetGrade)")
                        }
                        
                        ForEach(0..<numberOfStudents, id: \.self) { number in
                            VStack {
                                List {
                                    TextField("First name", text: $model.firstname)
                                    TextField("Surname", text: $model.surname)
                                    TextField("Class name", text: $model.clasname)
                                    TextField("Target grade", text: $model.targetGrade)
                                }
                                .frame(width: geometry.size.width * 0.5, height: 250)
                            }
                        }
                    }
                }
                #elseif os(macOS)
                EmptyView()
                #endif
            }
            #if os(iOS)
            .sheet(isPresented: $showingImporter) {
                CSVImporter { result in
                    switch result {
                    case .success(let students):
                        gradeCalculatorViewModel.replaceStudents(with: students)
                    case .failure(let error):
                        importError = error.localizedDescription
                    }
                }
            }
            #endif
        }
    }
}

#Preview {
    StudentDetailsView()
        .environment(GradeCalculatorViewModel())
}
