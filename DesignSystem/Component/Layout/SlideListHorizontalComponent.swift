//
//  SlideListHorizontalComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI



struct SlideListHorizontalComponent: View {
    let imageNames = ["forest_1", "forest_2", "forest_1", "forest_2", "forest_1", "forest_2", "forest_2", "forest_1", "forest_2", "forest_1"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // ScrollView horizontal
                    HStack(spacing: 10) { // HStack untuk tata letak horizontal dengan spasi
                        ForEach(imageNames, id: \.self) { imageName in
                            VStack{
                                Image(imageName)
                                    .scaledToFit()
                                    .scaledToFit()
                                    .frame(width: 100, height: 150) // Ukuran gambar
                                    .cornerRadius(8) // Sudut membulat (opsional)
                                Text("hello")
                            }
                        }
                    }
                    .padding(.horizontal) // Padding di sisi kiri dan kanan
                }
    }
}



#Preview {
    SlideListHorizontalComponent()
}
