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
                    viewModel.sendCode()
                    if viewModel.verificationID != nil {
                        codeInputViewActive = true
                    } else {
                        print(viewModel.verificationError ?? "aa")
                    }
                } label: {
                    Text("Отправить код")
                }
            }
            .navigationDestination(isPresented: $codeInputViewActive) {
                CodeInputView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    PhoneInputView()
}
