//
//  MovieCardView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 12.06.2024.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    let author: User
    let date: Date
    
    var body: some View {
        ZStack {
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack {
                AuthorInfoBar(author: author, date: formattedDate)
                    .padding(8)
                Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    Text("\(movie.year) г.")
                        .foregroundStyle(Color(uiColor: UIColor.systemGray3))
                        .fontWeight(.semibold)
                        .opacity(0.6)
                    Spacer()
                }
                .padding(10)
            }
            
        }
        .frame(height: 540)
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}

struct AuthorInfoBar: View {
    let author: User
    let date: String
    let avatar = "user-avatar"
    
    var body: some View {
        HStack {
            Image(avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading) {
                Text("\(author.name) \(author.lastName)")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text(date)
                    .foregroundStyle(Color(uiColor: UIColor.systemGray3))
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .opacity(0.6)
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "person.fill.badge.plus")
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 9)
                            .fill(.gray)
                            .opacity(0.6)
                    )
                    
            }
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 9)
                            .fill(.gray)
                            .opacity(0.6)
                    )
                    
            }
        }
    }
}

#Preview {
    MovieCardView(
        movie: Movie(
            title: "Бойцовский клуб",
            year: "1999",
            image: "fight-club"
        ),
        author: User(
            phone: "666",
            name: "Тайлер",
            lastName: "Дерден",
            nickname: "projectdestruction"
        ), date: Date()
    )
}
