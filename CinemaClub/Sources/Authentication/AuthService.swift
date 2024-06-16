//
//  AuthService.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 04.06.2024.
//

import FirebaseCore
import FirebaseAuth

final class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    func sendCode(to number: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { verificationId, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let verificationID = verificationId else {
                completion(
                    .failure(
                        NSError(
                            domain: "AuthError",
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to get verification ID"]
                        )
                    )
                )
                return
            }
            
            completion(.success(verificationID))
        }
    }
    
    func verifyCode(
        _ code: String,
        with verificationID: String,
        phoneNumber: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: code
        )
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard authResult?.user != nil else {
                completion(
                    .failure(
                        NSError(
                            domain: "AuthError",
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to get user"]
                        )
                    )
                )
                return
            }
            let user = User(
                phone: phoneNumber,
                name: "Тайлер",
                lastName: "Дерден",
                nickname: "projectmayhem"
            )
            LocalStorageService.shared.saveUserProfile(user)
            completion(.success(user))
        }
    }

    func fetchUserProfile() -> User? {
        return LocalStorageService.shared.fetchUserProfile()
    }

    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            LocalStorageService.shared.clearUserProfile()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}
