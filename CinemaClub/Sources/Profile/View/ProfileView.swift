//
//  ProfileView.swift
//  CinemaClub
//
//  Created by Мария Степанчук on 15.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isSettingsPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    HStack {
                        Spacer()
                        Text("@\(viewModel.user.nickname)")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button {
                            isSettingsPresented = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(.gray)
                        }
                        .sheet(isPresented: $isSettingsPresented) {
                            SettingsView(isPresented: $isSettingsPresented)
                        }
                    }

                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(viewModel.user.name) \(viewModel.user.lastName)")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("@\(viewModel.user.nickname)")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Image("user-avatar")
                            .resizable()
                            .frame(width: 62, height: 62)
                            .clipShape(Circle())
                    }

                    RectangleLabelView(title: "25", subtitle: "рецензий написано")
                        .frame(height: 50)
                    
                    HStack(spacing: 16) {
                        RectangleLabelView(title: "252", subtitle: "отслеживают")
                            .frame(height: 50)
                        RectangleLabelView(title: "54", subtitle: "отслеживаю")
                            .frame(height: 50)
                    }
                    Button {
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(uiColor: UIColor.systemGray6))
                                .frame(height: 50)
                            Text("поделится профилем")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.loadUserProfile()
        }
    }
}

private struct RectangleLabelView: View {
    let title: String
    let subtitle: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
            VStack {
                Text(title)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ProfileView()
}
