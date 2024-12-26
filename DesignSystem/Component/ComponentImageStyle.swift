//
//  ComponentImageStyle.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI

struct DesignSystemImageStyle: ViewModifier {
    let cornerRadius: CGFloat
    let borderColor: Color
    let borderWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
}


struct ComponentImageStyle: View {
    var body: some View {
        VStack {
            Image("exampleImage")
                .resizable()
                .scaledToFit()
                .componentImage() // Using modifier with value default

            Image("exampleImage")
                .resizable()
                .frame(width: 100, height: 100)
                .componentImage(cornerRadius: 16, borderColor: .blue, borderWidth: 2) // Using modifier with value default

            Image("exampleImage")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .componentCircleImage(borderColor: .blue)
        }
        .padding()
    }
}

#Preview {
    ComponentImageStyle()
}
