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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: UIColor.systemGray6))
        }
        .frame(height: 112)
    }
}

#Preview {
    PostTextView(
        title: "Бойцовский клуб: Смысл финала",
        text: 
            """
            "Анализ финальной сцены и её влияние на сюжет. Последняя сцена 'Бойцовского клуба'
            оставляет много вопросов. Главный герой разрушает свой иллюзорный мир, что символизирует
            его освобождение от внутренних демонов. Финальная сцена с падающими зданиями символизирует
            крах устоявшейся системы."
            """
    )
}
