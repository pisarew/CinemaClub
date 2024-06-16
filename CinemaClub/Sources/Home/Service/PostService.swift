//
//  PostService.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 16.06.2024.
//

import Foundation
import os

protocol PostService {
    func fetchData() async throws -> [Post]?
}

final class NetworkPostService: PostService {
    static let shared = NetworkPostService()
    
    private let decoder = JSONDecoder()
    private let logger = Logger()
    private let url = URL(string: "")!
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchData() async throws -> [Post]? {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                logger.error("Invalid response from server")
                throw URLError(.badServerResponse)
            }
            
            let dto = try decoder.decode(FilmPostResponseDTO.self, from: data)
            return dto.toPosts
        } catch {
            logger.error("Error fetching or decoding data: \(error.localizedDescription)")
            throw error
        }
    }
}
