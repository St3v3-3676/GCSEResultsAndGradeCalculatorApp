import SwiftUI
import AuthenticationServices

struct SignInButtonView: View {
    @Environment(AuthenticationViewModel.self) var authenticationViewModel
    
    let isLandscape: Bool
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: authenticationViewModel.onRequest,
            onCompletion: authenticationViewModel.onCompletion
        )
        .signInWithAppleButtonStyle(.black)
        .frame(width: width * ViewLayoutModel.setButtonScale(isLandscape: isLandscape))
        .frame(height: ViewLayoutModel.buttonHeight)
        .clipShape(RoundedRectangle(cornerRadius: ViewLayoutModel.cornerRadius))
    }
}

#Preview {
    SignInButtonView(isLandscape: false, width: 400, height: 50)
        .environment(AuthenticationViewModel())
}
