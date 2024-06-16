//
//  MockFavoritesService.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import Foundation

final class MockFavoritesService: FavoriteslistServiceProtocol {
    
    func fetchFavorites() async throws -> [Movie] {
        return []
    }
    
    func fetchViewed() async throws -> [Movie] {
        return []
    }
}
