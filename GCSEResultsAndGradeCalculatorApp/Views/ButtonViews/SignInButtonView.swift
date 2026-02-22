import SwiftUI
import AuthenticationServices

struct SignInButtonView: View {
    @Environment(AuthenticationViewModel.self) var authenticationViewModel

    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: authenticationViewModel.onRequest,
            onCompletion: authenticationViewModel.onCompletion
        )
        .signInWithAppleButtonStyle(.black)
        .frame(width: AuthenticationModel.SignInWithAppleButtonSize.width, height: AuthenticationModel.SignInWithAppleButtonSize.height)
        .frame(height: ViewLayoutModel.buttonHeight)
        .clipShape(RoundedRectangle(cornerRadius: ViewLayoutModel.cornerRadius))
    }
}

#Preview {
    SignInButtonView()
        .environment(AuthenticationViewModel())
}
