//
//  TextAreaCompoent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI

import SwiftUI

struct TextAreaStyle: ViewModifier {
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .padding(4)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isFocused ? .blue : Color(.systemGray4), lineWidth: 1)
            )
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(isFocused ? .blue : Color(.systemGray4))
                   .padding(.horizontal, 4)
            }
            .focused($isFocused)
    }
    
}


struct TextAreaStyleWithUnderLine: ViewModifier {
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .padding(.vertical, 8)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(isFocused ? .blue : Color(.systemGray4)) // Green if valid, red if invalid
                    .padding(.top, 35),
                alignment: .bottom
            ).overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(isFocused ? .blue : Color(.systemGray4))
                   .padding(.horizontal, 4)
            }
            .focused($isFocused)
    }
}


struct TextAreaCompoent: View {
    @State private var text: String = ""

    var body: some View {
        VStack{
            TextEditor(text: $text)
                .componentTextArea().padding()
                .frame(height: 100)
            TextEditor(text: $text)
                .compoentTextFieldUndeline().padding()
                .frame(height: 100)
            Spacer()
        }
    }
}
#Preview {
    TextAreaCompoent()
}
