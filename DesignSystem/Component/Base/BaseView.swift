//
//  BaseView.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import Foundation
import SwiftUI




extension View {
    
    //Text Style
    func textStyle(_ style: DesignSytemTextStyle.Style) -> some View {
        modifier(DesignSytemTextStyle(style: style))
    }
    
    // TextField
    func componentTextField() -> some View {
        modifier(TextFieldStyle())
    }
    func compoentTextFieldUndeline() -> some View {
        modifier(TextFieldStyleWithUnderLine())
    }
    
    //TextArea
    func componentTextArea() -> some View {
        modifier(TextAreaStyle())
    }
    func componentTextAreaUnderLine() -> some View {
        modifier(TextAreaStyleWithUnderLine())
    }
    
    // Image
    func componentImage(cornerRadius: CGFloat = 8, borderColor: Color = .gray, borderWidth: CGFloat = 1) -> some View {
        modifier(DesignSystemImageStyle(cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth))
    }
    
    
    func componentCircleImage(borderColor: Color = .red, borderWidth: CGFloat = 2) -> some View {
        self
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        
    }
    
    // Range
    func componentRange(sliderValue : Double)-> some View{
        modifier(DesignSystemRangeStyle(sliderValue: sliderValue))
    }
    
 
    
    
    // 
    
    
    
    
}



