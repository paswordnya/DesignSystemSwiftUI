//
//  GlobalStyleDesignSystem.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 26/12/24.
//

import Foundation
import SwiftUI



struct GlobalStyleDesignSystem {
    
    enum Style {
        case primary
        case secondary
        case success
        case danger
        case warning
        case info
        case light
        case dark
    }
    
    enum Size {
        case small
        case medium
        case large

        var padding: EdgeInsets {
            switch self {
            case .small:
                return EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
            case .medium:
                return EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
            case .large:
                return EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20)
            }
        }

        var fontSize: Font {
            switch self {
            case .small:
                return .caption
            case .medium:
                return .body
            case .large:
                return .title3
            }
        }
    }
   
}



