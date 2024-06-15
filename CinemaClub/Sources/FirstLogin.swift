//
//  FirstLogin.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 06.06.2024.
//

import SwiftUI

struct FirstLogin: View {
    @State private var isLoggedIn = UserDefaults.standard.isLoggedIn

    var body: some View {
        NavigationView {
            ZStack {
                if isLoggedIn {
                    TabBar()
                } else {
                    Image("image")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        Image("App-Icon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 5)
                        
                        Text("Развивай своего внутреннего критика")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Text("Пиши рецензии, оставляй лайки и общайся с друзьями в одном приложении!")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding([.horizontal, .top], 1)
                        
                        Spacer()
                        
                        NavigationLink(destination: PhoneInputView()) {
                            Text("Вступить в Киноклуб")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    }
                    .padding(.top, 420)
                }
            }
            .onAppear {
                isLoggedIn = UserDefaults.standard.isLoggedIn
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        FirstLogin()
    }
}
