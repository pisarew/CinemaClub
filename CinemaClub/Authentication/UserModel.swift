//
//  UserModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import Foundation

struct User {
    var phone: String
    var name: String
    var lastName: String
    var nickname: String
}

extension User {
    init() {
        phone = ""
        name = ""
        lastName = ""
        nickname = ""
    }
}
