//
//  FavoritesViewMode.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import Foundation

protocol FavoritesServiceProtocol {
    func fetchFavorites() -> [Movie]?
    func fetchViewed() -> [Movie]?
}

@Observable
final class FavoritesViewModel {
    
    private let service: FavoritesServiceProtocol
    
    init(service: FavoritesServiceProtocol) {
        self.service = service
    }
}
