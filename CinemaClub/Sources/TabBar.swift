//
//  TabBar.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 06.06.2024.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .systemGray3
    }

    var body: some View {
        TabView {
            HomeView()
                .tag(1)
                .tabItem {
                    Image("home")
                        .renderingMode(.template)
                }
            SearchView()
                .tag(2)
                .tabItem {
                    Image("discover")
                        .renderingMode(.template)
                }
            Text("the creation of the post")
                .tag(3)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                        .renderingMode(.template)
                }
            FavoritesView()
                .tag(4)
                .tabItem {
                    Image("heart")
                        .renderingMode(.template)
                }
            Text("profile")
                .tag(5)
                .tabItem {
                    Image(systemName: "person.fill")
                        .renderingMode(.template)
                }
        }
        .tint(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
