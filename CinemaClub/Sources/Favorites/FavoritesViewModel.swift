//
//  FavoritesViewMode.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import Foundation
import Combine

final class FavoritesViewModel: ObservableObject {
    private let service: FavoriteslistServiceProtocol
    @Published var favorites: [Movie] = []
    @Published var viewed: [Movie] = []
    
    init(service: FavoriteslistServiceProtocol = FavoriteslistService.shared) {
        self.service = service
    }
    
    func update() async {
        do {
            let favorites = try await service.fetchFavorites()
            let viewed = try await service.fetchViewed()
            
            DispatchQueue.main.async {
                self.favorites = favorites
                self.viewed = viewed
            }
        } catch {
            print("Ошибка при обновлении данных: \(error)")
        }
    }
}
