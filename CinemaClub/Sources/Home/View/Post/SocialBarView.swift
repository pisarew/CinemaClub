//
//  SocialBarView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 12.06.2024.
//

import SwiftUI

struct SocialBarView: View {
    let countOfLikes: Int
    let countOfComments: Int
    
    @State private var isLike = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
            HStack {
                Button {
                    isLike.toggle()
                    
                } label: {
                        Image("heart")
                            .renderingMode(.template)
                            .foregroundStyle(isLike ? .red : Color(uiColor: UIColor.systemGray3))
                }
                Text("\(countOfLikes)")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                
                Button {
                    
                } label: {
                    Image("message")
                        .renderingMode(.template)
                        .foregroundStyle(Color(uiColor: UIColor.systemGray3))
                }
                Text("\(countOfComments)")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                Spacer()
                Button {
                    
                } label: {
                    Image("paperplane")
                        .renderingMode(.template)
                        .foregroundStyle(Color(uiColor: UIColor.systemGray3))
                }
            }
            .padding(12)
        }
        .frame(height: 44)
    }
}

#Preview {
    SocialBarView(countOfLikes: 666, countOfComments: 13)
}
