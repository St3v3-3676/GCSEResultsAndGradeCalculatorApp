import SwiftUI
import AuthenticationServices

struct SignInWithAppleView: View {
    var onRequest: (ASAuthorizationAppleIDRequest) -> Void
    var onCompletion: (Result<ASAuthorization, Error>) -> Void

    var body: some View {
        VStack(spacing: 12) {
            SignInWithAppleButton(
                .signIn,
                onRequest: onRequest,
                onCompletion: onCompletion
            )
            .signInWithAppleButtonStyle(.black)
            .frame(maxWidth: 375)
            .frame(height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
}

#Preview {
    SignInWithAppleView(onRequest: { _ in }, onCompletion: { _ in })
}
