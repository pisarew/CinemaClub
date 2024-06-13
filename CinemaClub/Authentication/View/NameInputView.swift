//
//  NameInputView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import SwiftUI

struct NameInputView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var isFormValid: Bool {
        return !firstName.isEmpty && !lastName.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Представьтесь")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                TextField("Имя", text: $firstName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12.0)
                    .padding(.bottom, 10)
                
                TextField("Фамилия", text: $lastName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12.0)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: NicknameInputView()) {
                    Text("Продолжить")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isFormValid ? Color.red : Color.gray)
                        .cornerRadius(12.0)
                }
                .disabled(!isFormValid)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    NameInputView()
}
