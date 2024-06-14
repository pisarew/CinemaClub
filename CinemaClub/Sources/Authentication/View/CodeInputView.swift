//
//  CodeInputView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 06.06.2024.
//

import SwiftUI

struct CodeInputView: View {
    @Bindable var viewModel: AuthViewModel
    var phoneNumber: String
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    init(viewModel: AuthViewModel, phoneNumber: String) {
        self.viewModel = viewModel
        self.phoneNumber = phoneNumber
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Введите код")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .padding(.bottom, 10)
                Text("Код был отправлен на номер:")
                    .foregroundColor(.secondary)
                
                Text(phoneNumber)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                HStack(spacing: 10) {
                    ForEach(0..<6) { index in
                        CodeSquare(index: index, code: $code, focusedField: $focusedField)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationDestination(isPresented: $viewModel.isAuth) {
            NameInputView()
        }
        .onAppear {
            focusedField = 0
        }
        .onChange(of: code) {
            if code.joined().count == 6 {
                viewModel.verificationCode = code.joined()
                viewModel.verifyCode()
            }
        }
    }
}

struct CodeSquare: View {
    var index: Int
    @Binding var code: [String]
    @FocusState.Binding var focusedField: Int?
    
    var body: some View {
        TextField("", text: Binding(
            get: { code[index] },
            set: { newValue in
                if newValue.count > 1 {
                    code[index] = String(newValue.prefix(1))
                } else {
                    code[index] = newValue
                }
                
                if !newValue.isEmpty {
                    focusedField = min(index + 1, 5)
                }
            })
        )
        .frame(width: 50, height: 50)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
        .multilineTextAlignment(.center)
        .keyboardType(.numberPad)
        .focused($focusedField, equals: index)
        .onChange(of: focusedField) {
            if focusedField == index {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    focusedField = index
                }
            }
        }
    }
}

#Preview {
    CodeInputView(viewModel: AuthViewModel(), phoneNumber: "+7 965 212 64 14")
}
