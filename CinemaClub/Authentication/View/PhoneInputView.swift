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
    @State private var selectedCountryCode = "+7"
    @State private var phoneNumber = ""
    
    let countryCodes = [
        ("🇷🇺", "+7"),
        ("🇰🇿", "+77"),
        ("🇧🇾", "+375"),
        ("🇫🇷", "+33"),
        ("🇪🇸", "+34"),
        ("🇮🇹", "+39"),
        ("🇵🇱", "+48")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Ваш номер телефона")
                    .font(.system(size: 34, weight: .regular))
                
                Text("На него придет уведомление с кодом для входа в приложение")
                    .font(.subheadline)
                    .foregroundColor(.gray.opacity(0.79))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack {
                    Menu {
                        ForEach(countryCodes, id: \.1) { flag, code in
                            Button(action: {
                                selectedCountryCode = code
                            }) {
                                HStack {
                                    Text(flag)
                                    Text(code)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    } label: {
                        HStack {
                            let selectedFlag = countryCodes.first { $0.1 == selectedCountryCode }?.0 ?? "🇷🇺"
                            Text(selectedFlag)
                            Text(selectedCountryCode)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    }
                    
                    TextField("Введите номер", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(Color.secondary.opacity(0.2))
                        .cornerRadius(5)
                }
                .padding(.horizontal)
                
                Button {
                    viewModel.user.phone = selectedCountryCode + phoneNumber
                    Task {
                        await viewModel.sendCode()
                    }
                } label: {
                    Text("Отправить код")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Text("Нажимая “Отправить код” вы принимаете положение о Политике Приватности")
                    .font(.footnote)
                    .foregroundColor(.gray.opacity(0.79))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .overlay(
                        HStack {
                            Spacer()
                        }
                    )
                Spacer()
                
                VStack(spacing: 10) {
                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundColor(Color.red)
                            Text("Войти с Apple ID")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(Color.red)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(Color.red)
                            Text("Войти через Google")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(Color.red)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
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
