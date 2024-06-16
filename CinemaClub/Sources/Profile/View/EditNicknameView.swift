//
//  EditNicknameView.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import SwiftUI

struct EditNicknameView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ProfileViewModel
    @State private var newNickname: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 16) {
                TextField("Никнейм", text: $newNickname)
                    .padding()
                    .background(Color(uiColor: UIColor.systemGray6))
                    .cornerRadius(12)
                    .padding(.top, 20)

                Text("Ссылка на вас в КиноКлубе:")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                Text("kinoclub.com/\(newNickname)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)

                Button(action: {
                    viewModel.user.nickname = newNickname
                    isPresented = false
                }) {
                    Text("Изменить никнейм")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(12)
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .navigationTitle("Изменить никнейм")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Отмена")
                    }
                }
            }
        }
        .onAppear {
            newNickname = viewModel.user.nickname
        }
    }
}

struct EditNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        EditNicknameView(isPresented: .constant(true), viewModel: ProfileViewModel())
    }
}
