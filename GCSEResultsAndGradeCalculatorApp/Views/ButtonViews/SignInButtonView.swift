import SwiftUI
import AuthenticationServices

struct SignInButtonView: View {
    @Environment(AuthenticationViewModel.self) var authenticationViewModel
    
    var isLandscape: Bool

    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: authenticationViewModel.onRequest,
            onCompletion: authenticationViewModel.onCompletion
        )
        .frame(width: ViewLayoutModel.setSignInWithAppleButtonSize(isLandscape: isLandscape), height: ViewLayoutModel.buttonHeight)
        .signInWithAppleButtonStyle(.black)
        .clipShape(RoundedRectangle(cornerRadius: ViewLayoutModel.cornerRadius))
    }
}

#Preview {
    SignInButtonView(isLandscape: false)
        .environment(AuthenticationViewModel())
}
