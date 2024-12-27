//
//  MenuNavigationBarComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI

struct CustomBottomBarItem: Identifiable {
    let id: Int?
    let icon: String
    let text: String
    let action: () -> Void
}

struct ComponentBottomBarView: View {
    let items: [CustomBottomBarItem]
    @Binding var selection :Int
    
    var body: some View {
        VStack{
            HStack(spacing:0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Button(action: {
                        withAnimation {
                            selection = item.id ?? index
                            item.action()
                        }
                        
                    }) {
                        VStack {
                            Rectangle()
                                .fill(selection == item.id ? .blue : .clear)
                                .frame(height: 1)
                            
                            Image(systemName: item.icon)
                                .font(.system(size: 24))
                                .frame(height: 25)
                            Text(item.text)
                                .font(.caption)
                        }
                        .foregroundColor(selection == item.id ? .blue : .gray)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white) // Warna latar belakang bottom bar
            .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: -2)
            
        }
    }
}

struct MenuNavigationBarComponent: View {
    @State private var selectedItemId: Int = 0
    
    var body: some View {
        VStack {
            Group {
                if selectedItemId == 0 {
                    HomeView()
                } else if selectedItemId == 1 {
                    SearchView()
                } else if selectedItemId == 2 {
                    ProfileView()
                }
            }
            Spacer()
            ComponentBottomBarView(items: [
                CustomBottomBarItem(id: 0,icon: "house", text: "Home", action: {
                    print("Home tapped")
                    selectedItemId = 0
                }),
                CustomBottomBarItem(id: 1,icon: "magnifyingglass", text: "Search", action: {
                    selectedItemId = 1
                    
                }),
                CustomBottomBarItem(id: 2,icon: "person", text: "Profile", action: {
                    selectedItemId = 2
                })
            ], selection: $selectedItemId)
        }
    }
}


struct HomeView: View {
    var body: some View {
        Text("Welcome to Home")
            .componentTextStyle(.body)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search Content")
            .componentTextStyle(.body)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Page")
            .componentTextStyle(.body)
    }
}


#Preview {
    MenuNavigationBarComponent()
}
