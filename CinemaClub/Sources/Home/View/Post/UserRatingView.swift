//
//  UserRatingView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 12.06.2024.
//

import SwiftUI

struct UserRatingView: View {
    let rating: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
                .frame(height: 60)
            HStack {
                Text("Оценка пользователя:")
                    .fontWeight(.semibold)
                Spacer()
                Text("\(rating)")
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 9)
                            .fill(rating > 6 ? .green : .red)
                    )
            }
            .padding(8)
        }
    }
}

#Preview {
    UserRatingView(rating: 9)
}
