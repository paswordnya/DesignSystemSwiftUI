//
//  AlertComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI

struct DesignSystemAlert: View {
    let message: String
    let type: GlobalStyleDesignSystem.Style

    private var backgroundColor: Color {
        switch type {
        case .primary: return .blue.opacity(0.2)
        case .secondary: return .gray.opacity(0.2)
        case .success: return .green.opacity(0.2)
        case .danger: return .red.opacity(0.2)
        case .warning: return .yellow.opacity(0.2)
        case .info: return .cyan.opacity(0.2)
        case .light: return Color(.systemGray6)
        case .dark: return .black.opacity(0.2)
        }
    }

    private var borderColor: Color {
        switch type {
        case .primary: return .blue
        case .secondary: return .gray
        case .success: return .green
        case .danger: return .red
        case .warning: return .yellow
        case .info: return .cyan
        case .light: return .gray
        case .dark: return .gray
        }
    }

    private var textColor: Color {
        switch type {
        case .light, .warning: return .black
        default: return .primary
        }
    }

    var body: some View {
       
            ZStack {
                VStack {
                    Text(message)
                        .foregroundColor(textColor)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(backgroundColor)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(borderColor, lineWidth: 1)
                        )
                   
                }
            
        }
    }
}

struct AlertComponent: View {
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 10) {
            DesignSystemAlert(message: "This is a Design System-style alert!", type: .success)
            DesignSystemAlert(message: "This is a Design System-style alert!", type: .danger)
        }
    }
}

#Preview {
    AlertComponent()
}
