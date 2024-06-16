//
//  PostViewModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation
import Combine

protocol PostServiceProtocol {
    func fetchData() async throws -> [Post]?
}

@MainActor
final class PostViewModel: ObservableObject {
    private let service: PostServiceProtocol
    @Published var posts: [Post]?

    init(service: PostServiceProtocol) {
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
