//
//  AuthenticationViewModel.swift
//  GCSEGradesAndResultsApp
//
//  Created by Stephen Boyle on 17/02/2026.
//

import Foundation
import Observation
import AuthenticationServices
import LocalAuthentication
import SwiftUI

@Observable
final class AuthenticationViewModel {
    var username: String = ""
    var userEmail: String = ""
    var isAuthorized: Bool = false
    //This represents the local unlock state
    var isUnlocked: Bool = false
    
    @ObservationIgnored @AppStorage("storedName") private var storedName: String = ""
    @ObservationIgnored @AppStorage("storedEmail") private var storedEmail: String = ""
    @ObservationIgnored @AppStorage("userID") private var userID: String = ""
    @ObservationIgnored @AppStorage("biometricsEnabled") private var biometricsEnabledStorage: Bool = true
    @ObservationIgnored var biometryTypeStrings = AuthenticationModel.BiometryTypeStrings.faceID
    @ObservationIgnored var sifnInWithAppleButtonWidth = AuthenticationModel.SignInWithAppleButtonSize.width
    @ObservationIgnored var sifnInWithAppleButtonHeight = AuthenticationModel.SignInWithAppleButtonSize.height
    
    var biometricsEnabled: Bool {
        get { biometricsEnabledStorage }
        set { biometricsEnabledStorage = newValue }
    }

    init() {
        self.username = storedName
        self.userEmail = storedEmail
        self.isAuthorized = false
    }
    
    enum BiometryTypeStrings {
        @ObservationIgnored static let faceID = "Unlock with Face ID"
        @ObservationIgnored static let touchID = "Unlock with Touch ID"
        @ObservationIgnored static let passcode = "Unlock with passcode"
        @ObservationIgnored static let faceIDImageName = "faceid"
        @ObservationIgnored static let touchIDImageName = "touchid"
        @ObservationIgnored static let passcodeImageName = "key.fill"
    }
    
    func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    func onCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResults):
            guard let credential = authResults.credential as? ASAuthorizationAppleIDCredential else {
                return
            }
            if let givenName = credential.fullName?.givenName, !givenName.isEmpty {
                storedName = givenName
            }
            if let email = credential.email, !email.isEmpty {
                storedEmail = email
            }
            userID = credential.user
            username = storedName
            userEmail = storedEmail
            isAuthorized = true
        case .failure(let error):
            print("Authorisation failed: \(error.localizedDescription)")
        }
    }

    // Entry point to trigger automatic sign-in (e.g., from a View's .task)
    @MainActor
    func startAutoSignIn() {
        Task { await authorise() }
    }
    
    func authorise() async {
        guard !userID.isEmpty else {
            signOut()
            return
        }
        await checkCredentialState()
        isAuthorized = !userID.isEmpty
    }
    
    func signOut() {
        storedName = ""
        storedEmail = ""
        userID = ""
        username = ""
        userEmail = ""
        isAuthorized = false
        isUnlocked = false
    }
    
    func checkCredentialState() async {
        let currentUserID = userID
        guard !currentUserID.isEmpty else { return }
        let provider = ASAuthorizationAppleIDProvider()
        await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            provider.getCredentialState(forUserID: currentUserID) { state, _ in
                switch state {
                case .authorized:
                    Task { @MainActor in
                        let success = await self.authenticateWithBiometrics()
                        if !success {
                            self.isUnlocked = false
                        }
                        continuation.resume()
                    }
                    return
                case .revoked, .notFound, .transferred:
                    self.signOut()
                    continuation.resume()
                    return
                @unknown default:
                    self.signOut()
                    continuation.resume()
                    return
                }
            }
        }
    }
    
    //This method is used to perform biometric/passcode authentication

    // 2) Add a method to perform biometric/passcode authentication
    @MainActor
    func authenticateWithBiometrics(reason: String = "Unlock your account") async -> Bool {
        guard biometricsEnabled else {
            isUnlocked = false
            return false
        }
        // First attempt: biometrics only (no passcode)
        let bioOnlyContext = LAContext()
        bioOnlyContext.localizedCancelTitle = "Cancel"

        if bioOnlyContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            do {
                let bioSuccess = try await bioOnlyContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                if bioSuccess {
                    isUnlocked = true
                    return true
                }
            } catch {
                // Fall through to passcode-capable fallback
            }
        }

        // Second attempt: biometrics or passcode (system will prefer biometrics if available)
        let fallbackContext = LAContext()
        fallbackContext.localizedCancelTitle = "Cancel"

        if fallbackContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            do {
                let fallbackSuccess = try await fallbackContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason)
                isUnlocked = fallbackSuccess
                return fallbackSuccess
            } catch {
                isUnlocked = false
                return false
            }
        } else {
            isUnlocked = false
            return false
        }
    }
}

private struct RootContent: View {
    @Environment(AuthenticationViewModel.self) private var auth

    var body: some View {
        Group {
            if auth.isAuthorized {
                ContentView()
            } else {
                SignInView()
            }
        }
        .task {
            auth.startAutoSignIn()
        }
    }
}
 

