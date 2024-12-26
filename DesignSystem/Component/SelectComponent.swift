//
//  SelectComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI

import SwiftUI

struct DesignSystemSelect: View {
    @Binding var selection: String
    let options: [String]
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(selection)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "chevron.down")
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(.systemGray4))
                    .padding(.horizontal, 4)
            }
            .padding(.horizontal)
            .onTapGesture {
                isExpanded.toggle()
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6)) // Bg dropdown
                            .onTapGesture {
                                selection = option
                                isExpanded = false
                            }
                        Divider() // Spacer betwen opsi
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                .padding(.horizontal)
                .transition(.move(edge: .top)) // Animasi transisi
            }
        }.onTapGesture {
            isExpanded.toggle()
        }
    }
}

struct SelectComponent: View {
    @State private var selectedOption = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]

    var body: some View {
        DesignSystemSelect(selection: $selectedOption, options: options)
    }
}




#Preview {
    SelectComponent()
}
