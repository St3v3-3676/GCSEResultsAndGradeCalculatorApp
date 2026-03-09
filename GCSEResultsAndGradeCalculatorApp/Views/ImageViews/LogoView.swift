//
//  LogoView.swift
//  GCSEResultsAndGradeCalculatorApp
//
//  Created by Stephen Boyle on 21/02/2026.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image("AppLogo")
                .resizable()
                .frame(width: getLogoSize(), height: getLogoSize(), alignment: .center)
        }
    }
    
    func getLogoSize() -> CGFloat {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            return 250
        } else if device == .pad {
            return 400
        } else {
            return 250
        }
        #endif
        
        #if os(macOS)
        return 250
        #endif
    }
}

#Preview {
    LogoView()
}
