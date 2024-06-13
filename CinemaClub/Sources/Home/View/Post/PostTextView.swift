//
//  PostTextView.swift
//  CinemaClub
//
//  Created by Глеб Писарев on 12.06.2024.
//

import SwiftUI

struct PostTextView: View {
    let title: String
    let text: String
    
    @State private var isHidenText = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
            VStack {
                HStack {
                    Text(title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                HStack {
                    Text(text)
                        .lineLimit(isHidenText ? 1 : nil)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                Button {
                    withAnimation {
                        isHidenText.toggle()
                    }
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(uiColor: UIColor.systemGray5))
                            .frame(height: 30)
                        Text(isHidenText ? "Показать всю рицензию ⋁" : "Скрыть ⋀")
                            .foregroundStyle(.black)
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                    }
                    
                }
            }
            .padding(12)
        }
        .frame(maxHeight: isHidenText ? 112 : .infinity)
        .animation(.easeInOut, value: isHidenText)
    }
}

#Preview {
    PostTextView(
        title: "Бойцовский клуб: Смысл финала",
        text: 
            """
            Анализ финальной сцены и её влияние на сюжет. Последняя сцена 'Бойцовского клуба'
            оставляет много вопросов. Главный герой разрушает свой иллюзорный мир, что символизирует
            его освобождение от внутренних демонов. Финальная сцена с падающими зданиями символизирует
            крах устоявшейся системы.
            """
    )
}
