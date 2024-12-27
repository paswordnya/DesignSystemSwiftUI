//
//  TabComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI

struct TabPageComponent: View {
    var body: some View {
        TabView {
            ForEach(1..<6) { index in // Membuat beberapa tab
                randomColor()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always)) // Mengaktifkan style page dan menampilkan indikator halaman
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Menampilkan dot indicator
    }

    func randomColor() -> some View {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}


#Preview {
    TabPageComponent()
}
