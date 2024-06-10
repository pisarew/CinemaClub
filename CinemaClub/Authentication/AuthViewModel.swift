//
//  AuthViewModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import Foundation

@Observable final class AuthViewModel {
    var user = User()
    var verificationCode: String = ""
    var verificationID: String?
    var verificationError: String?
    var isAuth = false
    
    func sendCode() {
        AuthService.shared.sendCode(to: user.phone) { [weak self] result in
            switch result {
            case .success(let verificationID):
                self?.verificationID = verificationID
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
                self?._isAuth = true
            case .failure(let error):
                self?.verificationError = error.localizedDescription
                print(error.localizedDescription)
            }
        }
    }
}
