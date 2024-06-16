//
//  LoadingScreen.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 15.06.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Image("LoadingScreen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
    
    struct LoadingView_Previews: PreviewProvider {
        static var previews: some View {
            LoadingView()
        }
    }
}
