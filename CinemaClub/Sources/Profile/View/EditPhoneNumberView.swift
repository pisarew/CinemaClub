//
//  EditPhoneNumberView.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 16.06.2024.
//

import SwiftUI

struct EditPhoneNumberView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ProfileViewModel
    @State private var newPhoneNumber: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Номер телефона", text: $newPhoneNumber)
                    .padding()
                    .background(Color(uiColor: UIColor.systemGray6))
                    .cornerRadius(12)
                    .padding(.top, 20)

                Button(action: {
                    viewModel.user.phone = newPhoneNumber
                    isPresented = false
                }) {
                    Text("Изменить номер телефона")
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
            .navigationTitle("Изменить номер телефона")
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
            newPhoneNumber = viewModel.user.phone
        }
    }
}

struct EditPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhoneNumberView(isPresented: .constant(true), viewModel: ProfileViewModel())
    }
}
