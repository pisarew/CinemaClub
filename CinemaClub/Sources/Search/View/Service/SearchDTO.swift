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
