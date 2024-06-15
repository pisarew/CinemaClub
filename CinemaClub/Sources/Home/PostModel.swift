//
//  PostModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let rating: Int
    let author: User
    let movie: Movie
    let date: Date
    let description: String
    let likes: Int
    let comments: [Comment]
}

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let year: String
    let country: String
    let rating: Int
    let image: String
    let kinopoiskLink: String
    let description: String
}

struct Comment: Identifiable {
    let id = UUID()
    let text: String
    let user: User
}
