//
//  PopUpComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI





struct PopupView: View {
    @Binding var isPresented: Bool
    let message: String

    var body: some View {
        ZStack {
            Color.black.opacity(0.4) // Overlay gelap
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false // Menutup popup saat overlay di tap
                }
            VStack {
                Text(message).componentTextStyle(.medium, .primary)
                    .padding()
                Spacer()
                Button("Close") {
                    isPresented = false
                }
                .padding()
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

struct PopUpComponent: View {
    @State private var showPopup = false

    var body: some View {
        VStack {
//            Button("Show Popup") {
//                showPopup = true
//            }
          //  if showPopup {
                PopupView(isPresented: $showPopup, message: "This is a custom popup!")
                    .transition(.scale(scale: 0.8).combined(with: .opacity)) // Animasi transisi
           // }
        }
    }
}

#Preview {
    PopUpComponent()
}
