//
//  PostViewModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation
import Combine

protocol PostService {
    func fetchData() async throws -> [Post]?
}

@MainActor
final class PostViewModel: ObservableObject {
    private let service: PostService
    @Published var posts: [Post]?
    
    init(service: PostService) {
        self.service = service
    }
    
    func update() async {
        do {
            posts = try await service.fetchData()
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}
