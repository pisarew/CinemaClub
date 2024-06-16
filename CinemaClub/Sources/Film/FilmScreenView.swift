//
//  FilmScreenView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import SwiftUI

struct FilmScreenView: View {
    @Environment(\.openURL) private var openURL
    @State private var showAddPostScreen = false
    
    let film: Movie
    
    private let genres = [
        "Триллер",
        "Драмма",
        "Криминал"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                Image(film.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                FilmNameView(title: film.title, subtitle: "\(film.year) г., \(film.country)")
                Button {
                    showAddPostScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.red)
                        Text("+ Добавить в рецензию")
                            .foregroundStyle(.white)
                            .padding()
                    }
                }
                
                HStack {
                    RectangleLabelView(title: "\(film.rating)", subtitle: "Рейтинг")
                    RectangleLabelView(title: "100519", subtitle: "Посмотрят")
                    RectangleLabelView(title: "52000", subtitle: "Смотрели")
                    RectangleLabelView(title: "270", subtitle: "Рецензии")
                }
                
                Button {
                    if let url = URL(string: film.kinopoiskLink) {
                        openURL(url)
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(uiColor: UIColor.systemGray6))
                        HStack {
                            Image(systemName: "play.rectangle.fill")
                            Text("Смотреть на КиноПоиске")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.black)
                        .padding()
                    }
                }
                
                PostTextView(title: "Описание фильма", text: film.description)
                
                HStack {
                    Text("Жанры")
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    ForEach(genres, id: \.self) { genre in
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(uiColor: UIColor.systemGray6))
                                .frame(width: 102, height: 34)
                            Text("#" + genre)
                        }
                    }
                    Spacer()
                }
                
            }
            .padding()
        }
        .sheet(isPresented: $showAddPostScreen) {
            AddPostView(film: film)
        }
    }
}

private struct FilmNameView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
            HStack {
                VStack {
                    HStack {
                        Text(title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack {
                        Text(subtitle)
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 9)
                                .frame(width: 44, height: 44)
                                .foregroundStyle(Color(uiColor: UIColor.systemGray5))
                            
                        )
                        .padding(.trailing, 10)
                }
            }
            .padding(10)
        }
    }
}

private struct RectangleLabelView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
                .frame(width: 84, height: 84)
            VStack {
                Text(title)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    FilmScreenView(
        film: Movie(
            title: "Бойцовский клуб",
            year: "1999",
            country: "USA",
            rating: 9,
            image: "fight-club",
            kinopoiskLink: "https://www.kinopoisk.ru/film/361/",
            description: "История офисного работника, страдающего бессонницей, который создает подпольный бойцовский клуб."
        )
    )
}
