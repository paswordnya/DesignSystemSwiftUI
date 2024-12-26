//
//  RangeComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import SwiftUI


struct DesignSystemRangeStyle: ViewModifier {
    @State var sliderValue: Double = 10
    let range: ClosedRange<Double> = 0...100

    func body(content: Content) -> some View {
        VStack {
            HStack {
                Text("0")
                Spacer()
                Text("100")
            }
            .padding(.horizontal)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 4)
                    .foregroundColor(Color(.systemGray5))
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: CGFloat(sliderValue / range.upperBound) * (UIScreen.main.bounds.width - 40), height: 4) // Dynamic width
                    .foregroundColor(.blue)

                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .overlay(
                        Circle()
                            .stroke(.blue, lineWidth: 2)
                    )
                    .offset(x: CGFloat(sliderValue / range.upperBound) * (UIScreen.main.bounds.width - 40)) // Dynamic offset
            }
            .padding(.horizontal)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(.systemGray4))
                    .padding(.horizontal)
                    .padding(.top,12)
            }
            
            Slider(value: $sliderValue, in: range)
                .opacity(0) // Hide default slider
                .padding(.horizontal)

            Text("Value: \(Int(sliderValue))")
            content
        }
        .padding()
    }
}

struct RangeComponent: View {
    @State var sliderValue: Double = 10
    let range: ClosedRange<Double> = 0...100

    var body: some View {
        VStack {
            
        }.componentRange(sliderValue: 100)
            
    }
}

#Preview {
    RangeComponent()
}
