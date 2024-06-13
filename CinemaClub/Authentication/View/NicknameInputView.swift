//
//  NicknameInputView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//
import SwiftUI

struct NicknameInputView: View {
    @State private var nickname: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Выберите никнейм")
                .font(.largeTitle)
            
            TextField("Введите ваш никнейм", text: $nickname)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12.0)
                .padding(.bottom, 0)
            
            Text("Ссылка на вас в КиноКлубе:")
                .foregroundColor(.gray)
                .padding(.bottom, -15)
            
            if nickname.isEmpty {
                Text("kinoclub.com/@username")
                    .foregroundColor(.gray)
            } else {
                Text("kinoclub.com/\(nickname)")
                    .foregroundColor(.red)
            }
            
            Button(action: {
            }, label: {
                Text("Продолжить")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(nickname.isEmpty ? Color.gray : Color.red)
                    .cornerRadius(12.0)
            })
            .disabled(nickname.isEmpty)
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    NicknameInputView()
}
