//
//  BadgeComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI

struct BadgeView: View {
    let text: String
    let type: GlobalStyleDesignSystem.Style

   

    private var backgroundColor: Color {
        switch type {
        case .primary: return .blue
        case .secondary: return .gray
        case .success: return .green
        case .danger: return .red
        case .warning: return .yellow
        case .info: return .cyan
        case .light: return Color(.systemGray5)
        case .dark: return .black
        }
    }

    private var foregroundColor: Color {
        switch type {
        case .warning, .light: return .black
        default: return .white
        }
    }

    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(Capsule())
    }
}

struct BadgeComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Messages")
                BadgeView(text: "5", type: .danger)
            }

            HStack {
                Text("Notifications")
                BadgeView(text: "12", type: .success)
            }

            HStack {
                Text("Warnings")
                BadgeView(text: "2", type: .warning)
            }
            
            HStack {
                Text("Light Badge")
                BadgeView(text: "New", type: .light)
            }
            
            HStack {
                Text("Dark Badge")
                BadgeView(text: "Pro", type: .dark)
            }

            // Contoh dengan teks yang lebih panjang
            BadgeView(text: "Very Long Badge Text", type: .info)
        }
        .padding()
    }
}


#Preview {
    BadgeComponent()
}
