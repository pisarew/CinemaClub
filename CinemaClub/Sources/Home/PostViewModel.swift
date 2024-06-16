//
//  PostViewModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation

protocol PostServiceProtocol {
    func fetchData() async throws -> [Post]?
}

@Observable
final class PostViewModel {
    private let service: PostServiceProtocol
    var posts: [Post]?
    
    init(service: PostServiceProtocol) {
        self.service = service
    }
    
    func update() async {
        posts = try? await service.fetchData()
    }
}
