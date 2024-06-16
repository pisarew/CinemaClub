//
//  AddPostView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 15.06.2024.
//

import SwiftUI

struct AddPostView: View {
    var film: Movie
    
    @State private var title = ""
    @State private var text = ""
    @State private var rating = 5
    
    var body: some View {
        VStack {
            Text("Оставьте рецензию")
                .fontWeight(.semibold)
                .padding(.top)
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(uiColor: UIColor.systemGray6))
                    HStack {
                        Image(film.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        VStack {
                            HStack {
                                Text(film.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            HStack {
                                Text("\(film.year) г., \(film.country)")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                    .padding(10)
                }
                .frame(height: 117)
                .padding()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(uiColor: UIColor.systemGray6))
                    .frame(height: 50)
                TextField("Заголовок рецензии", text: $title)
                    .padding()
            }
            .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(uiColor: UIColor.systemGray6))
                VStack {
                    TextField("Текст рецензии", text: $text, axis: .vertical)
                    Spacer()
                }
                .padding()
            }
            .padding(.horizontal)
            .frame(height: 200)
            Spacer()
            HStack {
                Text("Ваша оценка")
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            Picker("Ваша оценка", selection: $rating) {
                ForEach((0...10), id: \.self) {
                    Text("\($0)")
                }
            }
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.red)
                    Text("Опубликовать")
                        .foregroundStyle(.white)
                }
                .frame(height: 50)
                .padding()
            }
        }
        .pickerStyle(.wheel)
    }
}

#Preview {
    AddPostView(
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
