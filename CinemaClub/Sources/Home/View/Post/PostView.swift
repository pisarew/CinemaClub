//
//  PostView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 12.06.2024.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack {
            MovieCardView(movie: post.movie, author: post.author, date: post.date)
            UserRatingView(rating: post.rating)
            PostTextView(title: post.title, text: post.description)
            SocialBarView(countOfLikes: post.likes, countOfComments: post.comments.count)
        }
        .padding(10)
    }
}

#Preview {
    PostView(
        post: Post(
            title: "Бойцовский клуб: Смысл финала", 
            rating: 9,
            author: User(
                phone: "666",
                name: "Тайлер",
                lastName: "Дерден",
                nickname: "projectdestruction"
            ),
            movie: Movie(title: "Бойцовский клуб", year: "1999", image: "fight-club"),
            date: Date(),
            description:
                            """
                            Анализ финальной сцены и её влияние на сюжет. Последняя сцена 'Бойцовского клуба'
                            оставляет много вопросов. Главный герой разрушает свой иллюзорный мир, что символизирует
                            его освобождение от внутренних демонов. Финальная сцена с падающими зданиями символизирует
                            крах устоявшейся системы.
                            """,
            likes: 10052019,
            comments: []
        )
    )
}
