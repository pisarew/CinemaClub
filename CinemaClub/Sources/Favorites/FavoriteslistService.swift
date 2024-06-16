//
//  FavoriteslistService.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 15.06.2024.
//

import Foundation
import OSLog

protocol FavoriteslistServiceProtocol {
    func fetchFavorites() async throws -> [Movie]
    func fetchViewed() async throws -> [Movie]
}

final class FavoriteslistService: FavoriteslistServiceProtocol {
    static let shared = FavoriteslistService()
    
    private let decoder = JSONDecoder()
    private let logger = Logger()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchFavorites() async throws -> [Movie] {
        guard let url = Bundle.main.url(forResource: "favorites", withExtension: "json") else { return [] }
        do {
            let jsonData = try Data(contentsOf: url)
            let dto = try decoder.decode(FilmResponseDTO.self, from: jsonData)
            return dto.toMovies
        } catch {
            logger.error("Ошибка при чтении или декодировании данных: \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchViewed() async throws -> [Movie] {
        guard let url = Bundle.main.url(forResource: "viewed", withExtension: "json") else { return [] }
        do {
            let jsonData = try Data(contentsOf: url)
            let dto = try decoder.decode(FilmResponseDTO.self, from: jsonData)
            return dto.toMovies
        } catch {
            logger.error("Ошибка при чтении или декодировании данных: \(error.localizedDescription)")
            throw error
        }
    }
}

struct FilmResponseDTO: Decodable {
    let data: [FilmDTO]
}

extension FilmResponseDTO {
    var toMovies: [Movie] {
        data.map { film in
            Movie(
                title: film.title,
                year: film.year,
                country: film.country,
                rating: film.rating,
                image: film.posterLink,
                kinopoiskLink: film.trailerLink,
                description: film.description
            )
        }
    }
}
