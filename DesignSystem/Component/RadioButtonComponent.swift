//
//  RadioButtonComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI

struct RadioButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Circle()
                .stroke(isSelected ? .blue : .gray, lineWidth: 2)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .fill(isSelected ? .blue : .clear)
                        .frame(width: 10, height: 10)
                )
            configuration.label
                .padding(.leading, 5)
        }
    }
}

struct RadioButtonComponent: View {
    @State private var selectedOption = 1

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Button {
                selectedOption = 1
            } label: {
                Text("Option 1")
            }
            .buttonStyle(RadioButtonStyle(isSelected: selectedOption == 1))

            Button {
                selectedOption = 2
            } label: {
                Text("Option 2")
            }
            .buttonStyle(RadioButtonStyle(isSelected: selectedOption == 2))

            Button {
                selectedOption = 3
            } label: {
                Text("Option 3")
            }
            .buttonStyle(RadioButtonStyle(isSelected: selectedOption == 3))
        }
        .padding()
    }
}

#Preview {
    RadioButtonComponent()
}
