import SwiftUI
import AuthenticationServices

struct SignInButtonView: View {
    @Environment(AuthenticationViewModel.self) var authenticationViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var isLandscape: Bool
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        let appleButtonScale: [CGFloat] = getAppleButtonScale(isLandscape: isLandscape)
        VStack {
            Text("Welcome")
                .font(.largeTitle.bold())
                .foregroundStyle(.primary)
            SignInWithAppleButton(
                .signIn,
                onRequest: authenticationViewModel.onRequest,
                onCompletion: authenticationViewModel.onCompletion
            )
            .frame(width: width * appleButtonScale[0], height: height * appleButtonScale[1])
            .signInWithAppleButtonStyle(colorScheme == .dark ? .black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    func getAppleButtonScale(isLandscape: Bool) -> [CGFloat] {
        #if os(iOS)
        let device = UIDevice.current.userInterfaceIdiom
        
        if device == .phone {
            return isLandscape ? [0.2,0.12]:[0.4,0.06]
        } else if device == .pad {
            return isLandscape ? [0.2,0.08]:[0.4,0.06]
        } else  {
            return [0.2,0.12]
        }
        #endif
        
        #if os(macOS)
        return [0.2,0.08]
        #endif
    }
}
