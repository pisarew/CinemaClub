//
//  MockSearchService.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 14.06.2024.
//

import Foundation
import OSLog

final class MockSearchService: SearchServiceProtocol {
    static let shared = MockSearchService()
    
    private let decoder = JSONDecoder()
    private let logger = Logger()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchPopularFilms() -> [Movie]? {
        guard let url = Bundle.main.url(forResource: "popular", withExtension: "json") else {
            logger.error("File not found")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let dto = try decoder.decode(FilmSelectionDTO.self, from: jsonData)
            return dto.toMovies
        } catch {
            logger.error("Ошибка деодирования данных: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchRecomendedFilms() -> [Movie]? {
        guard let url = Bundle.main.url(forResource: "recomended", withExtension: "json") else {
            logger.error("File not found")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let dto = try decoder.decode(FilmSelectionDTO.self, from: jsonData)
            return dto.toMovies
        } catch {
            logger.error("Ошибка деодирования данных: \(error.localizedDescription)")
            return nil
        }
    }
    
    
}
