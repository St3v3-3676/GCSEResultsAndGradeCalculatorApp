//
//  GradeCalculatorModel.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 09/03/2026.
//

import Foundation

struct GCSESubjectsModel {
    enum Subjects: String, CaseIterable {
        case ancientHistory, ancientLanguages, artAndDesign, astronomy, britishSignLanguage, business, citizenshipStudies, classicalCivilisation, combinedScience, computerScience, dance, designAndTechnology, drama, economics, electronics, engineering, english, filmStudies, foodPreperationAndNutrition, geography, geology, history, maths, mediaStudies, modernForeignLanguages, music, physicalEducation, physicalEducationShortCourse, psychology, religiousStudies, science, singleScience, sociology, statistics
        
        var subjectName: String {
            switch self {
            case .maths: return "Maths"
            case .english: return "English"
            case .science: return "Science"
            case .history: return "History"
            case .geography: return "Geography"
            case .music: return "Music"
            case .ancientLanguages: return "Ancient Languages"
            case .artAndDesign: return "Art and Design"
            case .citizenshipStudies: return "Citizenship Studies"
            case .combinedScience: return "Combined Science"
            case .computerScience: return "Computer Science"
            case .dance: return "Dance"
            case .drama: return "Drama"
            case .foodPreperationAndNutrition: return "Food, Preperation and Nutrition"
            case .modernForeignLanguages: return "Modern Foreign Languages"
            case .physicalEducation: return "Physical Education"
            case .religiousStudies: return "Religious Studies"
            case .singleScience: return "Single Science"
            case .ancientHistory: return "Ancient History"
            case .astronomy: return "Astronomy"
            case .business: return "Business"
            case .classicalCivilisation: return "Classical Civilisation"
            case .designAndTechnology: return "DT"
            case .economics: return "Economics"
            case .electronics: return "Electronics"
            case .engineering: return "Engineering"
            case .filmStudies: return "Film Studies"
            case .geology: return "Geology"
            case .mediaStudies: return "Media Studies"
            case .physicalEducationShortCourse: return "Physical Education Short Course"
            case .psychology: return "Psychology"
            case .sociology: return "Sociology"
            case .statistics: return "Statistics"
            case .britishSignLanguage: return "British Sign Language"
                
            }
        }
    }
    
    enum GradeBoundaryYears: String, CaseIterable {
        case twentySixteen, twentySeventeen, twentyEighteen, twentyNineteen, twentyTwenty, twentyTwentyOne, twentyTwentyTwo, twentyTwentyThree, twentyTwentyFour, twentyTwentyFive
        
        var year: String {
            switch self {
                case .twentySixteen: return "2016"
                case .twentySeventeen: return "2017"
                case .twentyEighteen: return "2018"
                case .twentyNineteen: return "2019"
                case .twentyTwenty: return "2020"
                case .twentyTwentyOne: return "2021"
                case .twentyTwentyTwo: return "2022"
                case .twentyTwentyThree: return "2023"
                case .twentyTwentyFour: return "2024"
                case .twentyTwentyFive: return "2025"
            }
            
        }
    }
    
    enum ExamBoards: String, CaseIterable {
        case aqa, pearsonEdexcel, ocr, wjec, ccea
        
        var examBoard: String {
            switch self {
            case.aqa: return "AQA Exam Board"
            case.pearsonEdexcel: return "Pearson Edexcel Exam Board"
                case.ocr: return "OCR Exam Board"
            case.wjec: return "WJEC/Eduqas Exam Board"
            case.ccea: return "CCEA Exam Board"
            }
        }
    }
    
    enum AQASubjects: String, CaseIterable {
        case artCraftAndDesign,artAndDesignFineArt, artAndDesignGraphic, artAndDesignPhotography, artAndDesignTextile,
             artAndDesign3D, bengali, biology, business, chemistry, chineseMandarin, citizenship, combinedScienceSynergy, combinedScienceTrilogy, computerScience, dance, designTechnology, drama, economics, engineering, englishLanguage, englishLiterature, foodPrepAndNutrition, french8652, french8658, geography8035, german8662, german8668, hebrewModern, history, italian, mathematics, mediaStudies, music, panjabi, physicalEducation, physics, polish, psycology, religiousStudies8061,religiousStudies8062, religiousStudies8063, scoiology, spanish8692, spanish8698, statistics, urdu
        
        var aqaSubjects: String {
            switch self {
            case.artCraftAndDesign: return "Art, Craft and Design (8201)"
            case.artAndDesignFineArt: return "Art and Design: Fine Art (8202)"
            case.artAndDesignGraphic: return "Art and Design: Graphic Design (8203)"
            case.artAndDesignPhotography: return "Art and Design: Photography (8206)"
            case.artAndDesignTextile: return "Art and Design: Textile Design (8204)"
            case.artAndDesign3D: return "Art and Design: 3D Design (8205)"
            case .bengali: return "Bengali (8638)"
            case .biology: return "Biology (8461)"
            case .business: return "Business (8132)"
            case .chemistry: return "Chemistry (8462)"
            case .chineseMandarin: return "Chinese Mandarin (8673)"
            case .citizenship: return "Citizenship (8100)"
            case .combinedScienceSynergy: return "Combined Science: Synergy (8465)"
            case .combinedScienceTrilogy: return "Combined Science: Trilogy (8464)"
            case .computerScience: return "Computer Science (8525)"
            case .dance: return "Dance (8236)"
            case .designTechnology: return "Design Technology (8552)"
            case .drama: return "Drama (8261)"
            case .economics: return "Economics (8136)"
            case .engineering: return "Engineering (8852)"
            case .englishLanguage: return "English Language (8700)"
            case .englishLiterature: return "English Literature (8702)"
            case .foodPrepAndNutrition: return "Food Prep and Nutrition (8585)"
            case .french8652: return "French (8652)"
            case .french8658: return "French (8658)"
            case .geography8035: return "Geography (8035)"
            case .german8662: return "German (8662)"
            case .german8668: return "German (8668)"
            case .hebrewModern: return "Hebrew Modern (8678)"
            case .history: return "History (8145)"
            case .italian: return "Italian (8663)"
            case .mathematics: return "Mathematics (8300)"
            case .mediaStudies: return "Media Studies (8572)"
            case .music: return "Music (8271)"
            case .panjabi: return "Panjabi (8683)"
            case .physicalEducation: return "Physical Education (8582)"
            case .physics: return "Physics (8463)"
            case .polish: return "Polish (8688)"
            case .psycology: return "Psychology (8182)"
            case .religiousStudies8061: return "Religious Studies (8061)"
            case .religiousStudies8062: return "Religious Studies (8062)"
            case .religiousStudies8063: return "Religious Studies (8063)"
            case .scoiology: return "Sociology (8192)"
            case .spanish8692: return "Spanish (8692)"
            case .spanish8698: return "Spanish 2 (8698)"
            case .statistics: return "Statistics (8382)"
            case .urdu: return "Urdu (8648)"
                
            }
        }
    }
    
    enum PearsonEdexcelSubjects: String, CaseIterable {
        case arabic, artAndDesign, artAndDesignMediaSector, astronomy, biblicalHebrew, business, businessAdminAndLawSector, chinese, citizenshipSector, citizenshipStudies, computerScience, designAndTechnology, designAndTechnologySector, drama, dramaTheatreStudiesPerformingArtsSector, englishLanguage, englishLiterature, englishSector, french, geographyA, geographyB, geographySector, german, greek, gujarati, history, historySector, informationCommunicationTechnologySector, japanese, languagesSector, mathematics, mathematicsAndStatisticsSector, modernLanguages, music, musicSector, persian, physicalEducation, physicalEducationAndSportSector, portuguese, psycology, psycologySector, religiousStudiesA, religiousStudiesB, religiousStudiesSector, russian, science, scienceSector, spanish, statistics, turkish, urdu
        
        var pearsonEdexcelSubjects: String {
            switch self {
            case .arabic: return "Arabic"
            case .artAndDesign: return "Art and Design"
            case .artAndDesignMediaSector: return "Art, Design and Media (Sector)"
            case .astronomy: return "Astronomy"
            case .biblicalHebrew: return "Biblical Hebrew"
            case .business: return "Business"
            case .businessAdminAndLawSector: return "Business, Administration and Law (Sector)"
            case .chinese: return "Chinese"
            case .citizenshipSector: return "Citizenship (Sector)"
            case .citizenshipStudies: return "Citizenship Studies"
            case .computerScience: return "Computer Science"
            case .designAndTechnology: return "Design and Technology"
            case .designAndTechnologySector: return "Design and Technology (Sector)"
            case .drama: return "Drama"
            case .dramaTheatreStudiesPerformingArtsSector: return "Drama, Theatre Studies and Performing Arts (Sector)"
            case .englishLanguage: return "English Language"
            case .englishLiterature: return "English Literature"
            case .englishSector: return "English (Sector)"
            case .french: return "French"
            case .geographyA: return "Geography A"
            case .geographyB: return "Geography B"
            case .geographySector: return "Geography (Sector)"
            case .german: return "German"
            case .greek: return "Greek"
            case .gujarati: return "Gujarati"
            case .history: return "History"
            case .historySector: return "History (Sector)"
            case .informationCommunicationTechnologySector: return "Information and Communication Technology (Sector)"
            case .japanese: return "Japanese"
            case .languagesSector: return "Languages (Sector)"
            case .mathematics: return "Mathematics"
            case .mathematicsAndStatisticsSector: return "Mathematics and Statistics (Sector)"
            case .modernLanguages: return "Modern Languages"
            case .music: return "Music"
            case .musicSector: return "Music (Sector)"
            case .persian: return "Persian"
            case .physicalEducation: return "Physical Education"
            case .physicalEducationAndSportSector: return "Physical Education and Sport (Sector)"
            case .portuguese: return "Portuguese"
            case .psycology: return "Psychology"
            case .psycologySector: return "Psychology (Sector)"
            case .religiousStudiesA: return "Religious Studies A"
            case .religiousStudiesB: return "Religious Studies B"
            case .religiousStudiesSector: return "Religious Studies (Sector)"
            case .russian: return "Russian"
            case .science: return "Science"
            case .scienceSector: return "Science (Sector)"
            case .spanish: return "Spanish"
            case .statistics: return "Statistics"
            case .turkish: return "Turkish"
            case .urdu: return "Urdu"
                
            }
        }
    }
    
    enum OcrSubjects: String, CaseIterable {
        case ancientHistory, artAndDesign, biologyA, biologyB, business, chemistryA, chemistryB, citizenshipStudies, classicalCivilisation, classicalGreek, computerScience, designAndTechnology, drama, economics, englishLanguage, englishLiterature, foodPrepAndNutrition, geographyA, geographyB, historyA, historyB, latin, mathematics, mediaStudies, music, physicalEducation, physicsA, physicsB, psychology, religiousStudies, scienceA, scienceB
        
        var ocrSubjectName: String {
            switch self {
            case .ancientHistory: return "Ancient History (9-1)"
            case .artAndDesign: return "Art and Design (9-1)"
            case .biologyA: return "Biology A (9-1) - Gateway Science Suite"
            case .biologyB: return "Biology B (9-1) - Twenty First Century Science Suite"
            case .business: return "Business (9-1)"
            case .chemistryA: return "Chemistry A (9-1)"
            case .chemistryB: return "Chemistry B (9-1)"
            case .citizenshipStudies: return "Citizenship Studies (9-1)"
            case .classicalCivilisation: return "Classical Civilisation (9-1)"
            case .classicalGreek: return "Classical Greek (9-1)"
            case .computerScience: return "Computer Science (9-1)"
            case .designAndTechnology: return "Design and Technology (9-1)"
            case .drama: return "Drama (9-1)"
            case .economics: return "Economics (9-1)"
            case .englishLanguage: return "English Language (9-1)"
            case .englishLiterature: return "English Literature (9-1)"
            case .foodPrepAndNutrition: return "Food Preparation and Nutrition (9-1)"
            case .geographyA: return "Geography A (Geographical Themes)(9-1)"
            case .geographyB: return "Geography B (Geography for Enquiring Minds)(9-1)"
            case .historyA: return "History A (Explaining the Modern World)(9-1)"
            case .historyB: return "History B (Schools History Project)(9-1)"
            case .latin: return "Latin (9-1)"
            case .mathematics: return "Mathematics (9-1)"
            case .mediaStudies: return "Media Studies (9-1)"
            case .music: return "Music (9-1)"
            case .physicalEducation: return "Physical Education (9-1)"
            case .physicsA: return "Physics A (9-1) - Gateway Science Suite"
            case .physicsB: return "Physics B (9-1) - Twenty First Century Science Suite"
            case .psychology: return "Psychology (9-1)"
            case .religiousStudies: return "Religious Studies (9-1)"
            case .scienceA: return "Science A (9-1) - Gateway Science Suite"
            case .scienceB: return "Science B (9-1) - Twenty First Century Science Suite"
            }
        }
    }
    
    enum WJECSubjects: String, CaseIterable {
        case artAndDesign, builtEnvironment, business, computerScience, dance, designAndTechnology, digitalMediaAndFilm, digitalTechnology, drama, electronics, english, filmStudies, foodAndNutrition, french, geography, geology, german, healthAndSocialCareChildrensCare, healthAndSocialCareChildcare, history, iaithALlenyddiaethGymraeg, latin, mathematics, mediaStudies, music, physicalEducation, religiousStudies, science, socialStudies, sociology, spanish, welshLanguage, welshLiterature, welshSecondLanguage
        
        var wjecSubjectName: String {
            switch self {
            case .artAndDesign: return "Art and Design"
            case .builtEnvironment: return "Built Environment"
            case .business: return "Business"
            case .computerScience: return "Computer Science"
            case .dance: return "Dance"
            case .designAndTechnology: return "Design and Technology"
            case .digitalMediaAndFilm: return "Digital Media and Film"
            case .digitalTechnology: return "Digital Technology"
            case .drama: return "Drama"
            case .electronics: return "Electronics"
            case .english: return "English"
            case .filmStudies: return "Film Studies"
            case .foodAndNutrition: return "Food and Nutrition"
            case .french: return "French"
            case .geography: return "Geography"
            case .geology: return "Geology"
            case .german: return "German"
            case .healthAndSocialCareChildrensCare: return "Health and Social Care (Children's Care)"
            case .healthAndSocialCareChildcare: return "Health and Social Care (Childcare)"
            case .history: return "History"
            case .iaithALlenyddiaethGymraeg: return "Iaith a Llenyddiaeth Gymraeg"
            case .latin: return "Latin"
            case .mathematics: return "Mathematics"
            case .mediaStudies: return "Media Studies"
            case .music: return "Music"
            case .physicalEducation: return "Physical Education"
            case .religiousStudies: return "Religious Studies"
            case .science: return "Science"
            case .socialStudies: return "Social Studies"
            case .sociology: return "Sociology"
            case .spanish: return "Spanish"
            case .welshLanguage: return "Welsh Language"
            case .welshLiterature: return "Welsh Literature"
            case .welshSecondLanguage: return "Welsh Second Language"
            }
        }
    }
    
    enum CceaSubjects: String, CaseIterable {
        case agricultureAndLandUse, artAndDesign, biology, businessAndCommunicationSystems, digitalTechnology, businessStudies, chemistry, constructionAndTheBuiltEnvironment, contemporaryCrafts, drama, economics, engineeringAndManufacturing, englishLanguage, englishLiterature, french, furtherMathematics, gaeilge, geography, german, governmentAndPolitics, healthAndSocialCare, history, homeEconomicsChildDevelopment, homeEconomicsFoodAndNutrition, hospitality, irish, learningForLifeAndWork, leisure, travelAndTourism, mathematics,
             motorVehicleAndRoadUserStudies, movingImageArts, music,physicalEducation, physics, religiousStudies, scienceDoubleAward, scienceSingleAward, spanish, statistics
        
        var cceaSubjectName: String {
            switch self {
            case .agricultureAndLandUse: return "Agriculture and Land Use"
            case .artAndDesign: return "Art and Design"
            case .biology: return "Biology"
            case .businessAndCommunicationSystems: return "Business and Communication Systems"
            case .digitalTechnology: return "Digital Technology"
            case .businessStudies: return "Business Studies"
            case .chemistry: return "Chemistry"
            case .constructionAndTheBuiltEnvironment: return "Construction and the Built Environment"
            case .contemporaryCrafts: return "Contemporary Crafts"
            case .drama: return "Drama"
            case .economics: return "Economics"
            case .engineeringAndManufacturing: return "Engineering and Manufacturing"
            case .englishLanguage: return "English Language"
            case .englishLiterature: return "English Literature"
            case .french: return "French"
            case .furtherMathematics: return "Further Mathematics"
            case .gaeilge: return "Gaeilge"
            case .geography: return "Geography"
            case .german: return "German"
            case .governmentAndPolitics: return "Government and Politics"
            case .healthAndSocialCare: return "Health and Social Care"
            case .history: return "History"
            case .homeEconomicsChildDevelopment: return "Home Economics: Child Development"
            case .homeEconomicsFoodAndNutrition: return "Home Economics: Food and Nutrition"
            case .hospitality: return "Hospitality"
            case .irish: return "Irish"
            case .learningForLifeAndWork: return "Learning for Life and Work"
            case .leisure: return "Leisure"
            case .travelAndTourism: return "Travel and Tourism"
            case .mathematics: return "Mathematics"
            case .motorVehicleAndRoadUserStudies: return "Motor Vehicle and Road User Studies"
            case .movingImageArts: return "Moving Image Arts"
            case .music: return "Music"
            case .physicalEducation: return "Physical Education"
            case .physics: return "Physics"
            case .religiousStudies: return "Religious Studies"
            case .scienceDoubleAward: return "Science (Double Award)"
            case .scienceSingleAward: return "Science (Single Award)"
            case .spanish: return "Spanish"
            case .statistics: return "Statistics"
            }
        }
    }
}

