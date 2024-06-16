//
//  AuthViewModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var user = User()
    @Published var verificationCode: String = ""
    @Published var verificationID: String?
    @Published var verificationError: String?
    @Published var isAuth = false
    @Published var isVerificationId = false
    
    func sendCode() {
        AuthService.shared.sendCode(to: user.phone) { [weak self] result in
            switch result {
            case .success(let verificationID):
                self?.verificationID = verificationID
                self?.isVerificationId = true
            case .failure(let error):
                self?.verificationError = error.localizedDescription
                print(error.localizedDescription)
            }
        }
    }
    
    func verifyCode() {
        guard let verificationID = verificationID else {
            verificationError = "verificationID is nil"
            return
        }
        
        AuthService.shared.verifyCode(
            verificationCode,
            with: verificationID,
            phoneNumber: user.phone
        ) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                self?.isAuth = true
                self?.saveUserLocally(user)
            case .failure(let error):
                self?.verificationError = error.localizedDescription
                print(error.localizedDescription)
            }
        }
    }
    
    private func saveUserLocally(_ user: User) {
        UserDefaults.standard.set(user.phone, forKey: "user_phone")
        UserDefaults.standard.set(user.name, forKey: "user_name")
        UserDefaults.standard.set(user.lastName, forKey: "user_lastName")
        UserDefaults.standard.set(user.nickname, forKey: "user_nickname")
    }
    
    func loadUserProfile() {
        if let phone = UserDefaults.standard.string(forKey: "user_phone"),
           let name = UserDefaults.standard.string(forKey: "user_name"),
           let lastName = UserDefaults.standard.string(forKey: "user_lastName"),
           let nickname = UserDefaults.standard.string(forKey: "user_nickname") {
            user = User(phone: phone, name: name, lastName: lastName, nickname: nickname)
            isAuth = true
        }
    }
    
    func logout() {
        AuthService.shared.logout { [weak self] result in
            switch result {
            case .success:
                self?.user = User()
                self?.isAuth = false
                self?.clearLocalUser()
            case .failure(let error):
                self?.verificationError = error.localizedDescription
                print(error.localizedDescription)
            }
        }
    }
    
    private func clearLocalUser() {
        UserDefaults.standard.removeObject(forKey: "user_phone")
        UserDefaults.standard.removeObject(forKey: "user_name")
        UserDefaults.standard.removeObject(forKey: "user_lastName")
        UserDefaults.standard.removeObject(forKey: "user_nickname")
    }
}
