//
//  FilmScreenView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import SwiftUI

struct FilmScreenView: View {
    let film: Movie
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Image(film.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            FilmNameView(title: film.title, subtitle: "\(film.year) г., \(film.country)")
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.red)
                    Text("+ Добавить в рецензию")
                        .foregroundStyle(.white)
                        .padding()
                }
            }
        }
        .padding()
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
