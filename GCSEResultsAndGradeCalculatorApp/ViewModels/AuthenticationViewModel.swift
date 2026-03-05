//
//  AuthenticationViewModel.swift
//  GCSEGradesAndResultsApp
//
//  Created by Stephen Boyle on 17/02/2026.
import Foundation
import Security
import Observation
import AuthenticationServices
import LocalAuthentication
import SwiftUI

@Observable
final class AuthenticationViewModel {
    enum AuthStep {
        case idle
        case biometricInProgress
        case biometricFailed
        case passcodeEntry
        case emailPasswordEntry
        case signingIn
    }

    var username: String = ""
    var userEmail: String = ""
    var isAuthorized: Bool = false
    var isUnlocked: Bool = false
    var isAuthenticating = false
    var errorMessage: String?

    var isPreview: Bool = false

    @ObservationIgnored @AppStorage("storedName") private var storedName: String = ""
    @ObservationIgnored @AppStorage("storedEmail") private var storedEmail: String = ""
    @ObservationIgnored @AppStorage("userID") private var userID: String = ""
    @ObservationIgnored @AppStorage("biometricsEnabled") private var biometricsEnabledStorage: Bool = true

    var isAppleIDConfigured: Bool = false

    var step: AuthStep = .idle

    var biometricsEnabled: Bool {
        get { biometricsEnabledStorage }
        set { biometricsEnabledStorage = newValue }
    }

    var isBiometricAvailable: Bool { currentBiometryType() != .none }

    var biometryLabel: String {
        switch currentBiometryType() {
        case .faceID: return "Unlock with Face ID"
        case .touchID: return "Unlock with Touch ID"
        default: return "Unlock"
        }
    }

    var biometryImageName: String {
        switch currentBiometryType() {
        case .faceID: return "faceid"
        case .touchID: return "touchid"
        default: return "key.fill"
        }
    }

    var hasBiometrics: Bool { currentBiometryType() != .none }

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

    func onRequest(_ request: ASAuthorizationAppleIDRequest) { request.requestedScopes = [.fullName, .email] }

    @MainActor
    func onCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResults):
            guard let credential = authResults.credential as? ASAuthorizationAppleIDCredential else { return }
            if let givenName = credential.fullName?.givenName, !givenName.isEmpty { storedName = givenName }
            if let email = credential.email, !email.isEmpty { storedEmail = email }
            userID = credential.user
            username = storedName
            userEmail = storedEmail
            isAuthorized = false
            isUnlocked = false
            isAppleIDConfigured = true
            step = .idle
        case .failure(let error):
            print("Authorisation failed: \(error.localizedDescription)")
            errorMessage = error.localizedDescription
        }
    }

    func authorise() async {
        guard !userID.isEmpty else { signOut(); return }
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
        step = .idle
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
        step = .biometricInProgress
        let success = await authenticateWithBiometrics()
        isAuthenticating = false
        if success {
            errorMessage = nil
            isAuthorized = true
            step = .idle
        } else {
            errorMessage = "Authentication failed"
            step = .biometricFailed
        }
    }

    @MainActor
    func authenticateWithBiometrics(reason: String = "Unlock your account") async -> Bool {
        guard biometricsEnabled else { isUnlocked = false; return false }
        let context = LAContext()
        context.localizedCancelTitle = "Cancel"
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason)
                if success {
                    isUnlocked = true
                    return true
                }
            } catch {
                // User cancel or failure will fall through
            }
        }
        isUnlocked = false
        return false
    }
}


