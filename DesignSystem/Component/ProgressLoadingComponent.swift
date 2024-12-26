//
//  ProgressLoadingComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//
import SwiftUI

struct CustomProgressBar: View {
    let progress: CGFloat
    let height: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: height)
                    .foregroundColor(Color(.systemGray5))
                    .cornerRadius(4)
                    Rectangle()
                        .frame(width: geometry.size.width * progress, height: height)
                        .foregroundColor(.blue)
                        .cornerRadius(4)
             
            }
        }
    }
}

struct ProgressLoadingComponent: View {
    @State private var progress: CGFloat = 0.01
    @State private var isIndeterminate = false

    var body: some View {
        VStack {
            CustomProgressBar(progress: isIndeterminate ? 0 : progress, height: 10)
                .padding()
        }
    }
}



#Preview {
    ProgressLoadingComponent()
}
