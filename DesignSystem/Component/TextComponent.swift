//
//  TextComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 24/12/24.
//

import SwiftUI

struct DesignSytemTextStyle: ViewModifier {
    enum Style {
        case heading1
        case heading2
        case heading3
        case body
        case small
        case monospace
        case colored(Color)
    }

    let style: Style

    func body(content: Content) -> some View {
        switch style {
        case .heading1:
            content.font(.system(size: 32, weight: .bold))
        case .heading2:
            content.font(.system(size: 24, weight: .bold))
        case .heading3:
            content.font(.system(size: 20, weight: .bold))
        case .body:
            content.font(.body)
        case .small:
            content.font(.caption)
        case .monospace:
            content.font(.system(.body, design: .monospaced))
        case .colored(let color):
            content.foregroundColor(color)
        }
    }
}


struct TextComponent: View {
    var titleText : String = "Text"
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Heading 1").textStyle(.heading1)
            Text("Paragraph text.").textStyle(.body)
            Text("Small text.").textStyle(.small)
            Text("Monospace text.").textStyle(.monospace)
            Text("Colored text.").textStyle(.colored(.green))
        }
        .padding()
    }
}
#Preview {
    TextComponent()
}
