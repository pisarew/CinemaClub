//
//  LocalStorageService.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import Foundation

final class LocalStorageService {
    
    static let shared = LocalStorageService()
    
    private init() {}
    
    func saveUserProfile(_ user: User) {
        UserDefaults.standard.set(user.phone, forKey: "user_phone")
        UserDefaults.standard.set(user.name, forKey: "user_name")
        UserDefaults.standard.set(user.lastName, forKey: "user_lastName")
        UserDefaults.standard.set(user.nickname, forKey: "user_nickname")
    }

    func fetchUserProfile() -> User? {
        guard let phone = UserDefaults.standard.string(forKey: "user_phone"),
              let name = UserDefaults.standard.string(forKey: "user_name"),
              let lastName = UserDefaults.standard.string(forKey: "user_lastName"),
              let nickname = UserDefaults.standard.string(forKey: "user_nickname") else {
            return nil
        }
        return User(phone: phone, name: name, lastName: lastName, nickname: nickname)
    }

    func clearUserProfile() {
        UserDefaults.standard.removeObject(forKey: "user_phone")
        UserDefaults.standard.removeObject(forKey: "user_name")
        UserDefaults.standard.removeObject(forKey: "user_lastName")
        UserDefaults.standard.removeObject(forKey: "user_nickname")
    }
}
