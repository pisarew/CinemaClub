//
//  MockPostService.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation

final class MockPostService: PostService {
    static let shared = MockPostService()
    
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func fetchData() async throws -> [Post]? {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else { return nil }
        do {
            let jsonData = try Data(contentsOf: url)
            let dto = try decoder.decode(FilmPostResponseDTO.self, from: jsonData)
            return dto.toPosts
        } catch {
            print("Ошибка при чтении или декодировании данных: \(error.localizedDescription)")
            throw error
        }
    }
}
