//
//  SearchViewModel.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 14.06.2024.
//

import Foundation

protocol SearchServiceProtocol {
    func fetchPopularFilms() -> [Movie]?
    func fetchRecomendedFilms() -> [Movie]?
    func fetchPersons() -> [Person]?
}

@Observable
final class SearchViewModel {
    var popular: [Movie]?
    var recomended: [Movie]?
    var persons: [Person]?
    
    private let service: SearchServiceProtocol
    
    init(service: SearchServiceProtocol) {
        self.service = service
    }
    
    func update() async {
        popular = service.fetchPopularFilms()
        recomended = service.fetchRecomendedFilms()
        persons = service.fetchPersons()
    }
}
