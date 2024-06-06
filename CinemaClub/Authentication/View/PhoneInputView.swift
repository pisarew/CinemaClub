//
//  PhoneInputView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import SwiftUI

struct PhoneInputView: View {
    @State private var viewModel = AuthViewModel()
    @State private var codeInputViewActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Введите номер", text: $viewModel.user.phone)
                    .keyboardType(.phonePad)
                
                Button {
                    Task {
                        await viewModel.sendCode()
                    }
                    codeInputViewActive.toggle()
                } label: {
                    Text("Отправить код")
                }
            }
        }
        .navigationDestination(isPresented: $codeInputViewActive) {
            CodeInputView(viewModel: viewModel)
        }
    }
}

#Preview {
    PhoneInputView()
}
