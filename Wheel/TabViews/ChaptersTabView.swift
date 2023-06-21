//
//  ChaptersTabView.swift
//  Wheel
//
//  Created by macbook on 20/06/2023.
//

import SwiftUI

struct ChaptersTabView: View {
    @State var searchText = ""
    var chapters: [Chapter]
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(chapters) { chapter in
                        NavigationLink {
                            AllCharactersTabView(characters: chapter.characters)
                        } label: {
                            ChapterCellView(chapter: chapter)
                            
                        }.navigationTitle("Wheel of Time")
                            .listRowBackground(
                                Color(uiColor: .systemFill)
                            )
                    }
                } header: {
                    VStack {
                        Spacer()
                        Text("The Eye of the world")
                        Spacer()
                    }
                }
            }
            
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .listStyle(.sidebar)
            
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.prussianBlue, for: .navigationBar)
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ChaptersTabView_Previews: PreviewProvider {
    static var chapters = ModelData().book.chapters
    static var previews: some View {
        ChaptersTabView(chapters: chapters)
    }
}
