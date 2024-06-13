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
            List {
                ForEach(viewModel.posts ?? []) { post in
                    PostView(post: post)
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
