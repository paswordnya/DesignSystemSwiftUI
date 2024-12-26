//
//  CheckBoxComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .blue : .gray) // Color like status
                .font(.system(size: 20)) // Size icon
                .onTapGesture { configuration.isOn.toggle() }
            configuration.label // Label checkbox
        }
    }
}

struct CheckBoxComponent: View {
    @State private var isChecked = false
    @State private var isChecked2 = true

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle("Check me", isOn: $isChecked)
                .toggleStyle(CheckboxStyle())
                .padding()

            Toggle(isOn: $isChecked2) {
                Text("Check me too").padding(.leading, 5)
            }
            .toggleStyle(CheckboxStyle())
            .padding()

        }
        .padding()
    }
}


#Preview {
    CheckBoxComponent()
}
