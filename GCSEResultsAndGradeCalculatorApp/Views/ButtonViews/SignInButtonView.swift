import SwiftUI
import AuthenticationServices

struct SignInButtonView: View {
    @Environment(AuthenticationViewModel.self) var authenticationViewModel
    
    var isLandscape: Bool
    var width: CGFloat
    var height: CGFloat

    
    var body: some View {
        VStack {
            Text("Welcome")
                .font(ViewLayoutModel.fontSize.titleFont)
            SignInWithAppleButton(
                .signIn,
                onRequest: authenticationViewModel.onRequest,
                onCompletion: authenticationViewModel.onCompletion
            )
            .frame(width: width, height: height)
            .signInWithAppleButtonStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: ViewLayoutModel.cornerRadius))
        }
    }
}

#Preview {
    SignInButtonView(isLandscape: false, width: 100, height: 50)
        .environment(AuthenticationViewModel())
}
