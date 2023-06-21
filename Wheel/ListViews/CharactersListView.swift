//
//  CharactersListView.swift
//  Wheel
//
//  Created by macbook on 20/06/2023.
//

import SwiftUI

struct CharactersListView: View {
    @State private var searchText = ""
    var characters: [Character]
    
    private var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(filteredCharacters) { character in
                    CharacterCellView(character: character)
                }
                .listRowBackground(
                    Color(uiColor: .systemFill)
                )
            } header: {
                Text("Characters")
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.prussianBlue, for: .automatic)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    
}

struct CharactersListView_Previews: PreviewProvider {
    static var characters = ModelData().book.chapters[1].characters
    static var previews: some View {
        CharactersListView(characters: characters)
    }
}
