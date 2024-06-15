//
//  Service.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 14.06.2024.
//

import Foundation

struct FilmSelectionDTO: Decodable {
    let data: [FilmDTO]
}

struct PersonsDTO: Decodable {
    let data: [PersonDTO]
}

struct PersonDTO: Decodable {
    let name: String
    let lastName: String
    let photo: String
}

extension FilmSelectionDTO {
    var toMovies: [Movie] {
        data.map { film in
            Movie(
                title: film.title,
                year: film.year,
                image: film.posterLink
            )
        }
    }
}

extension PersonsDTO {
    var toPerson: [Person] {
        data.map { person in
            Person(
                name: person.name,
                lastName: person.lastName,
                photo: person.photo
            )
        }
    }
}
