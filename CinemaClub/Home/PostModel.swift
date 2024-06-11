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
    let author: User
    let movie: Movie
    let date: Date
    let description: String
    let likes: Int
    let comments: [Comment]
}

struct Movie {
    let title: String
    let image: String
}

struct Comment: Identifiable {
    let id = UUID()
    let text: String
    let user: User
}
