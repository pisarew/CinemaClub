//
//  SettingsView.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isEditingNamePresented = false
    @State private var isEditingNicknamePresented = false
    @State private var isEditingPhoneNumberPresented = false
    @State private var showAlert = false
    @State private var showLogoutAlert = false
    @State private var showDeleteAccountAlert = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    SectionHeaderView(title: "Профиль")
                    
                    Button(action: {
                        isEditingNamePresented = true
                    }) {
                        SettingsFieldView(title: "Отображаемое имя", value: "\(viewModel.user.name) \(viewModel.user.lastName)")
                    }
                    .sheet(isPresented: $isEditingNamePresented, content: {
                        EditNameView(isPresented: $isEditingNamePresented, viewModel: viewModel)
                    })
                    
                    Button(action: {
                        isEditingNicknamePresented = true
                    }) {
                        SettingsFieldView(title: "Никнейм", value: "@\(viewModel.user.nickname)")
                    }
                    .sheet(isPresented: $isEditingNicknamePresented, content: {
                        EditNicknameView(isPresented: $isEditingNicknamePresented, viewModel: viewModel)
                    })
                    
                    Button(action: {
                        isEditingPhoneNumberPresented = true
                    }) {
                        SettingsFieldView(title: "Номер телефона", value: viewModel.user.phone)
                    }
                    .sheet(isPresented: $isEditingPhoneNumberPresented, content: {
                        EditPhoneNumberView(isPresented: $isEditingPhoneNumberPresented, viewModel: viewModel)
                    })
                    
                    SectionHeaderView(title: "Приложение")
                    
                    ToggleSettingsFieldView(
                        title: "Скрыть мой профиль",
                        description: "Ваш профиль будет виден только Вам",
                        isOn: .constant(false)
                    )
                    
                    Button(action: {
                    }) {
                        SettingsFieldView(title: "Уведомления", value: "")
                    }
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        SettingsFieldView(title: "Сообщить об ошибке", value: "")
                    }
                    .alert(isPresented: $showAlert, content: {
                        Alert(
                            title: Text("Сообщить об ошибке"),
                            message: Text("Сообщите нам на почту stemasha03@mail.ru"),
                            dismissButton: .default(Text("ОК"))
                        )
                    })
                    
                    Button(action: {
                        showLogoutAlert = true
                    }) {
                        SettingsFieldView(title: "Выйти из аккаунта", value: "", isRed: true)
                    }
                    .alert(isPresented: $showLogoutAlert, content: {
                        Alert(
                            title: Text("Вы уверены, что хотите выйти из аккаунта?"),
                            primaryButton: .destructive(Text("Да"), action: {
                            }),
                            secondaryButton: .cancel(Text("Отмена"))
                        )
                    })
                    
                    Button(action: {
                        showDeleteAccountAlert = true
                    }) {
                        SettingsFieldView(title: "Удалить аккаунт", value: "", isRed: true)
                    }
                    .alert(isPresented: $showDeleteAccountAlert, content: {
                        Alert(
                            title: Text("Вы уверены, что хотите удалить аккаунт?"),
                            message: Text("Это действие нельзя отменить."),
                            primaryButton: .destructive(Text("Да"), action: {
                            }),
                            secondaryButton: .cancel(Text("Отмена"))
                        )
                    })
                }
                .padding(.horizontal)
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Закрыть")
                    }
                }
            }
        }
    }
}

private struct SettingsFieldView: View {
    let title: String
    let value: String
    var isRed: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundColor(isRed ? .red : .black)
            if !value.isEmpty {
                Text(value)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
        .background(Color(uiColor: UIColor.systemGray6))
        .cornerRadius(12)
        .padding(.vertical, 4)
    }
}

private struct ToggleSettingsFieldView: View {
    let title: String
    let description: String
    @Binding var isOn: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(description)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                Toggle("", isOn: $isOn)
                    .labelsHidden()
                    .accentColor(.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
        .background(Color(uiColor: UIColor.systemGray6))
        .cornerRadius(12)
        .padding(.vertical, 4) 
    }
}

private struct SectionHeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top, 16)
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(uiColor: UIColor.systemBackground))
    }
}
