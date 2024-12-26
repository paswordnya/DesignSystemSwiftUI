//
//  ButtonViewComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI


struct DesignSystemTextButtonStyle: ButtonStyle {
    let style: GlobalStyleDesignSystem.Style
    let size: GlobalStyleDesignSystem.Size

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .foregroundColor(Color.white)
            .underline(configuration.isPressed, color: foregroundColor(for: style)) // Underline ontap
            .opacity(configuration.isPressed ? 0.7 : 1.0) // Opacity saat ditekan
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed) // Animation
            .background(foregroundColor(for: style))
            .cornerRadius(10)
            .font(buttonSize(for: size))

    }
    private func buttonSize(for size: GlobalStyleDesignSystem.Size) -> Font {
        switch size {
            case .small:
                return .caption
            case .medium:
                return .body
            case .large:
                return .title3
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

struct ButtonViewComponent: View {
    var body: some View {
        VStack {
            Button("Primary Link") {
            
            }
            .buttonStyle(DesignSystemTextButtonStyle(style: .primary,size: .small))
            

        }
        .padding()
    }
}


#Preview {
    ButtonViewComponent()
}
