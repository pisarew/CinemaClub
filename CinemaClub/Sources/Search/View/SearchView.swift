//
//  SearchView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 14.06.2024.
//

import SwiftUI

private enum SearchType: String, CaseIterable, Identifiable {
    case movies = "Фильмы"
    case authors = "Авторы"
    var id: Self { self }
}

struct SearchView: View {
    @State private var searchText = ""
    @State private var searchType: SearchType = .movies
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Search", selection: $searchType) {
                    ForEach(SearchType.allCases) { type in
                        Text(type.rawValue)
                    }
                }
                .padding(.horizontal)
                
                if searchType == .movies {
                    MovieSearchView()
                } else {
                    MovieSearchView()
                }
            }
            .pickerStyle(.segmented)
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    SearchView()
}
