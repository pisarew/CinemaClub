//
//  HomeView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 11.06.2024.
//

import SwiftUI

struct HomeView: View {
    @Bindable private var viewModel = PostViewModel(service: MockPostService.shared)
    
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
                }
                .toolbar {
                    Button {
                        
                    } label: {
                         Image("bell")
                            .renderingMode(.template)
                            .foregroundStyle(Color(uiColor: UIColor.systemGray4))
                    }
                    Button {
                        
                    } label: {
                         Image("paperplane")
                            .renderingMode(.template)
                            .foregroundStyle(Color(uiColor: UIColor.systemGray4))
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
