//
//  ProfileViewModel.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import Foundation
import FirebaseAuth

final class ProfileViewModel: ObservableObject {
    @Published var user = User()
    @Published var isAuth = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let authService = AuthService.shared
    
    init() {
        loadUserProfile()
    }
    
    func loadUserProfile() {
        isLoading = true
        if let localUser = authService.fetchUserProfile() {
            self.user = localUser
            self.isAuth = true
        } else {
            self.errorMessage = "User profile not found"
        }
        isLoading = false
    }
}
