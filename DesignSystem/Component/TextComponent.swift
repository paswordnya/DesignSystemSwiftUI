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
        case medium
        case small
        case monospace
        case colored(Color)
    }

    let style: Style
    let textColor : GlobalStyleDesignSystem.Style

    func body(content: Content) -> some View {
        switch style {
        case .heading1:
            content.font(.system(size: 32, weight: .bold)).foregroundColor(foregroundColor(for: textColor))
        case .heading2:
            content.font(.system(size: 24, weight: .bold)).foregroundColor(foregroundColor(for: textColor))
        case .heading3:
            content.font(.system(size: 20, weight: .bold)).foregroundColor(foregroundColor(for: textColor))
        case .body:
            content.font(.body).foregroundColor(foregroundColor(for: textColor))
        case .medium:
            content.font(.system(size: 18, weight: .medium)).foregroundColor(foregroundColor(for: textColor))
        case .small:
            content.font(.caption).foregroundColor(foregroundColor(for: textColor))
        case .monospace:
            content.font(.system(.body, design: .monospaced)).foregroundColor(foregroundColor(for: textColor))
        case .colored(let color):
            content.foregroundColor(color).foregroundColor(foregroundColor(for: textColor))
        }
    }
    
    private func foregroundColor(for style: GlobalStyleDesignSystem.Style) -> Color {
        switch style {
        case .primary: return Color.blue
        case .secondary: return Color.gray
        case .success: return Color.green
        case .danger: return Color.red
        case .warning: return Color.yellow
        case .info: return Color.cyan
        case .light: return Color(.systemGray)
        case .dark: return Color.black
        }
    }
}


struct TextComponent: View {
    var titleText : String = "Text"
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Heading 1").componentTextStyle(.heading1)
            Text("Paragraph text.").componentTextStyle(.body)
            Text("Medium text.").componentTextStyle(.medium)
            Text("Small text.").componentTextStyle(.small)
            Text("Monospace text.").componentTextStyle(.monospace)
            Text("Colored text.").componentTextStyle(.colored(.green))
        }
        .padding()
    }
}
#Preview {
    TextComponent()
}
