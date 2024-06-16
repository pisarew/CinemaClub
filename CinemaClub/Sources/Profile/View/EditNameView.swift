//
//  EditNameView.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import SwiftUI

struct EditNameView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ProfileViewModel
    @State private var newName: String = ""
    @State private var newLastName: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Имя", text: $newName)
                    .padding()
                    .background(Color(uiColor: UIColor.systemGray6))
                    .cornerRadius(12)
                    .padding(.top, 20)

                TextField("Фамилия", text: $newLastName)
                    .padding()
                    .background(Color(uiColor: UIColor.systemGray6))
                    .cornerRadius(12)

                Button(action: {
                    viewModel.user.name = newName
                    viewModel.user.lastName = newLastName
                    isPresented = false
                }) {
                    Text("Изменить имя")
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
            .navigationTitle("Изменить имя")
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
            newName = viewModel.user.name
            newLastName = viewModel.user.lastName
        }
    }
}

struct EditNameView_Previews: PreviewProvider {
    static var previews: some View {
        EditNameView(isPresented: .constant(true), viewModel: ProfileViewModel())
    }
}
