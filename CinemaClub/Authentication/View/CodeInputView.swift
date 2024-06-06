//
//  CodeInputView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import SwiftUI

struct CodeInputView: View {
    @Bindable var viewModel: AuthViewModel
    @State private var nameInputViewActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Введите код", text: $viewModel.verificationCode)
                    .keyboardType(.phonePad)
                
                Button {
                    viewModel.verifyCode()
                    if viewModel.isAuth {
                        nameInputViewActive.toggle()
                    }
                } label: {
                    Text("Отправить код")
                }
            }
        }
        .navigationDestination(isPresented: $nameInputViewActive) {
            NameInputView()
        }
    }
}

#Preview {
    CodeInputView(viewModel: AuthViewModel())
}
