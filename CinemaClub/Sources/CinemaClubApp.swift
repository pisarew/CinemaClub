//
//  CinemaClubApp.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 01.05.2024.
//

import SwiftUI

@main
struct CinemaClubApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var postViewModel = PostViewModel(service: MockPostService.shared)
    @State private var isLoading = true
    @State private var isLoggedIn = UserDefaults.standard.isLoggedIn

    var body: some Scene {
        WindowGroup {
            if isLoading {
                LoadingView()
                    .onAppear {
                        loadData()
                    }
            } else {
                if isLoggedIn {
                    TabBar()
                        .environmentObject(postViewModel)
                } else {
                    FirstLogin()
                }
            }
        }
    }

    private func loadData() {
        Task {
            await postViewModel.update()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}
