//
//  SearchModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 14.06.2024.
//

import Foundation

struct Selection: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let lastName: String
    let photo: String
}

extension Selection {
    static var selections: [Selection] {
        [
            Selection(
                title: "Топ 250 фильмов",
                description: "Лучшие фильмы за всё время",
                image: "selection-1"
            ),
            Selection(
                title: "Топ 500 фильмов",
                description: "Лучие фильмы за всё время",
                image: "selection-2"
            ),
            Selection(
                title: "100 великих фильмов XXI века",
                description: "100 великих фильмов текущего столетия",
                image: "selection-3"
            )
        ]
    }
}
