//
//  AuthenticationViewModel.swift
//  GCSEGradesAndResultsApp
//
//  Created by Stephen Boyle on 17/02/2026.
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
    var isAuthenticating = false
    var errorMessage: String?
    
    @ObservationIgnored @AppStorage("storedName") private var storedName: String = ""
    @ObservationIgnored @AppStorage("storedEmail") private var storedEmail: String = ""
    @ObservationIgnored @AppStorage("userID") private var userID: String = ""
    @ObservationIgnored @AppStorage("biometricsEnabled") private var biometricsEnabledStorage: Bool = true

    var isAppleIDConfigured: Bool = false
    
    var biometricsEnabled: Bool {
        get { biometricsEnabledStorage }
        set { biometricsEnabledStorage = newValue }
    }

    var biometryLabel: String {
        switch currentBiometryType() {
        case .faceID:
            return "Unlock with Face ID"
        case .touchID:
            return "Unlock with Touch ID"
        default:
            return "Unlock"
        }
    }

    var biometryImageName: String {
        switch currentBiometryType() {
        case .faceID:
            return "faceid"
        case .touchID:
            return "touchid"
        default:
            return "key.fill"
        }
    }

    var hasBiometrics: Bool {
        currentBiometryType() != .none
    }

    var biometryUnavailableMessage: String {
        #if os(macOS)
        return "Touch ID is unavailable. Enable Touch ID in System Settings > Touch ID & Password."
        #else
        return "Biometrics unavailable on this device"
        #endif
    }

    init() {
        self.username = storedName
        self.userEmail = storedEmail
        self.isAuthorized = false
        self.isAppleIDConfigured = !userID.isEmpty
        self.errorMessage = nil
    }
    
    func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    @MainActor
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
            isAuthorized = false
            isUnlocked = false
            isAppleIDConfigured = true
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
        isAppleIDConfigured = true
        await checkCredentialState()
        isAuthorized = isUnlocked
    }

    private func currentBiometryType() -> LABiometryType {
        let context = LAContext()
        _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        return context.biometryType
    }
    
    func signOut() {
        storedName = ""
        storedEmail = ""
        userID = ""
        username = ""
        userEmail = ""
        isAuthorized = false
        isUnlocked = false
        isAppleIDConfigured = false
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
                        self.isUnlocked = false
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

    @MainActor
    func attemptUnlock() async {
        
        guard !isAuthenticating else { return }
        isAuthenticating = true
        let success = await authenticateWithBiometrics()
        isAuthenticating = false
        if success {
            errorMessage = nil
            isAuthorized = true
        } else {
            errorMessage = "Authentication failed"
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

    // Biometrics-only flow for explicit user intent on the button.
//    @MainActor
//    func authenticateWithBiometricsOnly(reason: String = "Unlock your account") async -> Bool {
//        guard biometricsEnabled else {
//            isUnlocked = false
//            return false
//        }
//
//        let context = LAContext()
//        context.localizedCancelTitle = "Cancel"
//
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
//            do {
//                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
//                isUnlocked = success
//                return success
//            } catch {
//                isUnlocked = false
//                return false
//            }
//        } else {
//            isUnlocked = false
//            return false
//        }
//    }
}


 
