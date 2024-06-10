//
//  CodeInputView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import SwiftUI

struct CodeInputView: View {
    @Bindable var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Введите код", text: $viewModel.verificationCode)
                    .keyboardType(.phonePad)
                Button {
                    viewModel.verifyCode()  
                } label: {
                    Text("Отправить код")
                }
            }
            .navigationDestination(isPresented: $viewModel.isAuth) {
                NameInputView()
            }
        }
        
    }
}

#Preview {
    CodeInputView(viewModel: AuthViewModel())
}
