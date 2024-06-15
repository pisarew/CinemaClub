//
//  MockFavoritesService.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import Foundation

final class MockFavoritesService: FavoritesServiceProtocol {
    
    func fetchFavorites() -> [Movie]? {
        return nil
    }
    
    func fetchViewed() -> [Movie]? {
        return nil
    }
    
}
