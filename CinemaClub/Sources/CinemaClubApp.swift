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

    var body: some Scene {
        WindowGroup {
            if isLoading {
                LoadingView()
                    .onAppear {
                        loadData()
                    }
            } else {
                TabBar()
                    .environmentObject(postViewModel)
            }
        }
    }

    private func loadData() {
        Task {
            await postViewModel.update()
            // Добавьте здесь любую другую необходимую инициализацию
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Задержка для демонстрации экрана загрузки
                isLoading = false
            }
        }
    }
}
