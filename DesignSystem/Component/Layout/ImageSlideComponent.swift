//
//  ImageSlideComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI



struct ImageSlideComponent: View {
    @State private var currentPage = 0
    let images = ["forest_1", "forest_2", "forest_1"]
        
        var body: some View {
            
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFill()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 200)
                .cornerRadius(10)
                .padding([.leading, .trailing], 10)
                Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPage = (currentPage + 1) % images.count
                    }
                }
            }
        }
        
        let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

}

#Preview {
    ImageSlideComponent()
}
