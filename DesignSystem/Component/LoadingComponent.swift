//
//  LoadingComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI

struct LoadingSpinner: View {
    @State private var isRotating = false
    var background = GlobalStyleDesignSystem.Style.info

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8) // Membuat lingkaran tidak penuh
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)) // Gaya stroke
            .fill(foregroundColor(for: background))
            .frame(width: 30, height: 30)
            .rotationEffect(Angle(degrees: isRotating ? 360 : 0)) // Animasi rotasi
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isRotating) // Config animasi
            .onAppear {
                isRotating = true // Start Animation view showing
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



struct LoadingComponent: View {
    @State private var isLoading = false

    var body: some View {
        VStack {
            LoadingSpinner()
        }
    }
}


#Preview {
    LoadingComponent()
}
