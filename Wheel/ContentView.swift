//
//  ContentView.swift
//  Wheel
//
//  Created by macbook on 13/06/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var selection: Tab = .chapters
    @State private var filter = FilterCategory.chronological
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case chronological = "Chronological"
        case name = "Name"
        case book = "Book"
        
        var id: FilterCategory { self }
    }
    
    enum Tab {
        case chapters
        case allCharacters
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ChaptersTabView(chapters: modelData.book.chapters)
                .tabItem {
                    Label("Chapters", systemImage: "book")
                }
                .tag(Tab.chapters)
            
            NavigationView {
                AllCharactersTabView(characters: modelData.allCharacters)
            }
            .tabItem {
                Label("All Characters", systemImage: "person.3")
            }
            .tag(Tab.allCharacters)
        
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.prussianBlue.opacity(0.8))
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance

        }
        .tint(.pink)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
