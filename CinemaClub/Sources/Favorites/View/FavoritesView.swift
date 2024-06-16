//
//  FavoritesView.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 15.06.2024.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    @State private var searchText = ""
    @State private var selectedTab: Tab = .favorites
    @State private var showFilmDetailView = false
    @State private var selectedFilm: Movie?
    
    enum Tab: String, CaseIterable, Identifiable {
        case favorites = "Посмотрю"
        case viewed = "Смотрел"
        var id: Self { self }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top)
                
                Picker("Selection", selection: $selectedTab) {
                    ForEach(Tab.allCases) { tab in
                        Text(tab.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredMovies, id: \.id) { movie in
                            Image(movie.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 176.5, height: 263)
                                .clipped()
                                .cornerRadius(8)
                                .onTapGesture {
                                    selectedFilm = movie
                                    showFilmDetailView = true
                                }
                        }
                    }
                    .padding()
                }
                .onAppear {
                    Task {
                        await viewModel.update()
                    }
                }
                .sheet(isPresented: $showFilmDetailView) {
                    if let film = selectedFilm {
                        FilmScreenView(film: film)
                    }
                }
            }
        }
    }
    
    private var filteredMovies: [Movie] {
        let movies = selectedTab == .favorites ? viewModel.favorites : viewModel.viewed
        return movies.filter { movie in
            searchText.isEmpty || movie.title.localizedCaseInsensitiveContains(searchText)
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Поиск"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
