//
//  TabViewComponent.swift
//  DesignSystem
//
//  Created by Rakka Purnama on 27/12/24.
//

import SwiftUI
struct TabMenu {
    var icon: Image?
    var title: String
}
struct TabsViewComponent: View {
    var fixed = true
    var tabs: [TabMenu]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        // Image
                                        AnyView(tabs[row].icon)
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                                        // Text
                                        Text(tabs[row].title)
                                            .font(Font.system(size: 18, weight: .semibold))
                                            .foregroundColor(Color.black)
                                            .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
                                    // Bar Indicator
                                    Rectangle().fill(selectedTab == row ? Color.blue : Color.clear)
                                        .frame(height: 3)
                                }.fixedSize()
                            })
                                .accentColor(Color.white)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = UIColor(.white)
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}
struct TabViewMenuComponent: View {
    @State private var selectedTab: Int = 0
    let tabs: [TabMenu] = [
          .init(icon: Image(systemName: "music.note"), title: "Music"),
          .init(icon: Image(systemName: "film.fill"), title: "Movies"),
          .init(icon: Image(systemName: "book.fill"), title: "Books")
      ]
    var body: some View {
        NavigationView {
            VStack(spacing: 1){
                ToolbarComponent(title: "Activity and tools", action: {
                    // self.presentationMode.wrappedValue.dismiss()
                })
                GeometryReader { geo in
                    VStack(spacing: 0) {
                        // Tabs
                        TabsViewComponent(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                        
                        // Views
                        TabView(selection: $selectedTab,
                                content: {
                            HomeView()
                                .tag(0)
                            SearchView()
                                .tag(1)
                            ProfileView()
                                .tag(2)
                        })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .foregroundColor(Color.white)
                    // .ignoresSafeArea()
                    
                }
            }
        }
        
    }
}

#Preview {
    TabViewMenuComponent()
}
