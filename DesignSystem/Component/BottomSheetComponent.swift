//
//  BottomSheetComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI


struct BottomSheetComponent<Content: View>: View {
    @Binding var isPresented: Bool
    @State private var contentHeight: CGFloat = 0
    let content: () -> Content
    
    var body: some View {
        VStack {
            content()
                .frame(maxWidth: .infinity)
                .background(GeometryReader { geometry in
                    Color.clear.onAppear {
                        contentHeight = geometry.size.height
                    }
                })
            
            Spacer()
        }.padding()
            .frame(maxHeight: .infinity)
            .background(Color.white)// Add top and bottom border
            .cornerRadius(15)
            .presentationDetents([.fraction(min(contentHeight / UIScreen.main.bounds.height, 1.0))])
    }
}


struct BottomSheetView: View {
    @State private var isBottomSheetPresented = false
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Button("Show") {
                isBottomSheetPresented = true
            }
            .buttonStyle(DesignSystemTextButtonStyle(style: .primary,size: .medium))
        }.sheet(isPresented: $isBottomSheetPresented) {
            BottomSheetComponent(isPresented: $isBottomSheetPresented) {
                ContentView()
            }
        }
    }
}

#Preview {
    BottomSheetView()
}
