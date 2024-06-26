//
//  PostDTO.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation

struct FilmPostResponseDTO: Decodable {
    let data: [FilmPostDTO]
}

struct FilmPostDTO: Decodable {
    let id: Int
    let dt: String
    let rating: Int
    let title: String
    let description: String
    let toFilm: FilmDTO
    let user: UserDTO
    let likes: Int
    let comments: Int
}

struct FilmDTO: Decodable {
    let title: String
    let year: String
    let country: String
    let rating: Int
    let posterLink: String
    let trailerLink: String
    let description: String
}

struct UserDTO: Decodable {
    let name: String
    let lastName: String
}

extension FilmPostResponseDTO {
    var toPosts: [Post] {
        data.map { post in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let date = dateFormatter.date(from: post.dt) ?? Date()
            
            return Post(
                title: post.title,
                
                rating: post.rating,
                author: User(phone: "", name: post.user.name, lastName: post.user.lastName, nickname: ""),
                movie: Movie(
                    title: post.toFilm.title,
                    year: post.toFilm.year,
                    country: post.toFilm.country,
                    rating: post.toFilm.rating,
                    image: post.toFilm.posterLink,
                    kinopoiskLink: post.toFilm.trailerLink,
                    description: post.description
                ),
                date: date,
                description: post.description,
                likes: Int.random(in: 13...10000),
                comments: []
            )
        }
    }
}
