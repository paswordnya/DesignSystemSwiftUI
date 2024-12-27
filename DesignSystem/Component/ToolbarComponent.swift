//
//  ToolbarComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI

struct ToolbarComponent: View {
    let title: String
    let action: () -> Void
    let iconBack: String = "arrow.left"
    @State private var imageSize: CGFloat = .zero
    
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: iconBack)
                    .font(.title2)
                    .padding([.leading,.trailing],12)
                    .onTapGesture {
                        action()
                    }
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .onAppear {
                                    let size = CGSize(width: geometry.size.width, height: geometry.size.height)
                                    let average: CGFloat = (size.width + size.height) / 2
                                    imageSize = average
                                }
                                .onChange(of: geometry.size) { newSize in
                                    let size = CGSize(width: newSize.width, height: newSize.height)
                                    let average: CGFloat = (size.width + size.height) / 2
                                    imageSize = average
                                }
                        }
                    )
                Spacer()
                
            }
            
            Text(title)
                .font(.headline)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.leading, title.count > 30 ? imageSize : 0)
        }
        .padding(.vertical, 8) // Padding vertikal untuk toolbar
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline) // Untuk iOS 16+
    }
    
    func getImageSize(from imageName: String) -> CGSize? {
        guard let image = UIImage(named: imageName) else {
            return nil // Gambar tidak ditemukan
        }
        print(image)
        return image.size
    }
}
struct ExampleToolbarComponent: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            ToolbarComponent(title: "Activity and tools", action: {
                self.presentationMode.wrappedValue.dismiss()
            })
            Spacer()
        }
        
    }
}

#Preview {
    ExampleToolbarComponent()
}
