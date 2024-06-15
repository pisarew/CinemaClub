//
//  UserDefaults.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let isLoggedIn = "isLoggedIn"
    }

    var isLoggedIn: Bool {
        get {
            return bool(forKey: Keys.isLoggedIn)
        }
        set {
            set(newValue, forKey: Keys.isLoggedIn)
        }
    }
}
