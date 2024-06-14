//
//  MoviewSearchView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 14.06.2024.
//

import SwiftUI

struct MovieSearchView: View {
    @Bindable private var viewModel = SearchViewModel(service: MockSearchService.shared)
    
    private let genres = [
        "Триллер",
        "Криминал",
        "Драмма",
        "Боевик",
        "Фентези",
        "Ужасы",
        "Милодрамма",
        "Приключения",
        "Комедия"
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            SectionTitle(title: "Популярно сейчас")
            
            FilmSelectionView(content: $viewModel.popular)
                .onAppear {
                    Task {
                        await viewModel.update()
                    }
                }
                .padding(.bottom, 16)
            
            SectionTitle(title: "Фильмы по жанрам")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(genres, id: \.self) {genre in
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 9)
                                    .fill(Color(uiColor: UIColor.systemGray6))
                                    .frame(width: 143, height: 60)
                                Text("#\(genre)")
                                    .foregroundStyle(.black)
                            }
                        }
                        .padding(.leading, 8)
                    }
                }
            }
            .padding(.bottom, 16)
            
            SectionTitle(title: "Подборки")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(Selection.selections) { selection in
                        VStack {
                            Image(selection.image)
                                .resizable()
                                .frame(width: 295, height: 215)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            HStack {
                                Text(selection.title)
                                Spacer()
                            }
                            HStack {
                                Text(selection.description)
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 13))
                                Spacer()
                            }
                        }
                        .padding(.leading, 8)
                    }
                }
            }
            .padding(.bottom, 16)
            
            SectionTitle(title: "Рекомендовано вам")
            
            FilmSelectionView(content: $viewModel.recomended)
                .padding(.bottom, 16)
            
            SectionTitle(title: "Популярные личности")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.persons ?? []) { person in
                        VStack {
                            Image(person.photo)
                                .resizable()
                                .frame(width: 84, height: 84)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            Text(person.name)
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                            Text(person.lastName)
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                        }
                        .padding(.leading, 8)
                    }
                }
            }
              
        }
    }
}

struct FilmSelectionView: View {
    @Binding var content: [Movie]?
    
    var body: some View {
        if content == nil {
            ProgressView()
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(content ?? []) { film in
                        Image(film.image)
                            .resizable()
                            .frame(width: 143, height: 215)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.leading, 8)
                    }
                }
            }
        }
    }
}

struct SectionTitle: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(.leading, 8)
    }
}

#Preview {
    MovieSearchView()
}
