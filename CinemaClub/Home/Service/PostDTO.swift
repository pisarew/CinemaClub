//
//  PostDTO.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation

struct FilmPostResponseDTO: Codable {
    let data: [FilmPostDTO]
}

struct FilmPostDTO: Codable {
    let id: Int
    let dt: String
    let rating: Int
    let title: String
    let description: String
    let toFilm: FilmDTO
    let user: UserDTO
    let likes: Int
    let comments: Int

    enum CodingKeysDTO: String, CodingKey {
        case id, dt, rating, title, description
        case toFilm = "to_film"
        case user, likes, comments
    }
}

struct FilmDTO: Codable {
    let title: String
    let year: String
    let posterLink: String?

    enum CodingKeys: String, CodingKey {
        case title, year
        case posterLink = "poster_link"
    }
}

struct UserDTO: Codable {
    let name: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case name
        case lastName = "last_name"
    }
}

extension FilmPostResponseDTO {
    var toPosts: [Post] {
        data.map { post in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let date = dateFormatter.date(from: post.dt)
            
            return Post(
                title: post.title,
                author: User(phone: "", name: post.user.name, lastName: post.user.lastName, nickname: ""),
                movie: Movie(title: post.toFilm.title, image: post.toFilm.posterLink ?? ""),
                date: date ?? Date(),
                description: post.description,
                likes: Int.random(in: 13...10000),
                comments: []
            )
        }
    }
}
