//
//  GradeCalculatorViewModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 09/03/2026.
//

import Foundation
import Observation

@Observable
class GradeCalculatorViewModel {
    var firstname: String = ""
    var surname: String = ""
    var clasname: String = ""
    var targetGrade: String = ""
    
    var numberOfStudents: String = ""
    var students: [Student] = []
    
    var selectedSubject: String = GCSESubjectsModel.Subjects.allCases.first?.subjectName ?? ""
    
    var selectedBoundaryYear: String = GCSESubjectsModel.GradeBoundaryYears.allCases.first?.year ?? ""
    
    var selectedExamBoard: String = GCSESubjectsModel.ExamBoards.allCases.first?.examBoard ?? ""
    
    var aqaSubjects: [String] { GCSESubjectsModel.AQASubjects.allCases.map { $0.aqaSubjects} }
    
    var pearsonEdexcelSubjects: [String] { GCSESubjectsModel.PearsonEdexcelSubjects.allCases.map { $0.pearsonEdexcelSubjects } }
    
    var ocrSubjects: [String] { GCSESubjectsModel.OcrSubjects.allCases.map { $0.ocrSubjectName } }
    
    var wjecSubjects: [String] { GCSESubjectsModel.WJECSubjects.allCases.map { $0.wjecSubjectName } }
    
    var cceaSubjects: [String] { GCSESubjectsModel.CceaSubjects.allCases.map { $0.cceaSubjectName } }
    
    var boundaryYears: [String] { GCSESubjectsModel.GradeBoundaryYears.allCases.map { $0.year } }
    
    var examBoards: [String] { GCSESubjectsModel.ExamBoards.allCases.map { $0.examBoard } }
     
    
    func getBoundaryYears() -> [String] {
        return boundaryYears
    }
    
    func getExamBoards() -> [String] {
        return examBoards
    }
    
    func getSubjects() -> [String] {
        if self.selectedExamBoard == "AQA (Assessment and Qualifications Alliance)" {
            return aqaSubjects
        } else if self.selectedExamBoard == "Pearson Edexcel" {
            return pearsonEdexcelSubjects
        } else if self.selectedExamBoard == "OCR (Oxford, Cambridge and RSA Examinations)" {
            return ocrSubjects
        } else if self.selectedExamBoard == "WJEC/Eduqas:" {
            return wjecSubjects
        } else {
            return cceaSubjects
        }
    }
    
    func replaceStudents(with newStudents: [Student]) {
        self.students = newStudents
        self.numberOfStudents = String(newStudents.count)
    }
}
