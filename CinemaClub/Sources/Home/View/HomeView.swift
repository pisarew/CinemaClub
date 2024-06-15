//
//  HomeView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PostViewModel(service: MockPostService.shared)
    
    var body: some View {
        NavigationStack {
            if viewModel.posts == nil {
                ProgressView()
                    .onAppear {
                        Task {
                            await viewModel.update()
                        }
                    }
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.posts ?? []) { post in
                            PostView(post: post)
                        }
                    }
                }
                .navigationTitle("Новое и актуальное")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                        } label: {
                            Image("loupe")
                                .renderingMode(.template)
                                .foregroundStyle(Color(uiColor: UIColor.systemGray4))
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button {
                                // Действие для второй кнопки
                            } label: {
                                Image("bell")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color(uiColor: UIColor.systemGray4))
                            }
                            Button {
                                // Действие для третьей кнопки
                            } label: {
                                Image("paperplane")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color(uiColor: UIColor.systemGray4))
                            }
                        }
                    }
                }
            }
        }
        .refreshable {
            await viewModel.update()
        }
    }
}

#Preview {
    HomeView()
}
