//
//  AllCharactersTabView.swift
//  Wheel
//
//  Created by macbook on 16/06/2023.
//

import SwiftUI


enum SortCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case name = "Name"
    case id = "Id"
    
    var id: SortCategory { self }
}

struct AllCharactersTabView: View {
    @State private var sortOption = SortCategory.all
    @State private var isAscending = false
    var characters: [Character]
    
    var sortedCharacters: [Character] {
        var sortedChars = characters
        
        switch sortOption {
        case .all:
            return sortedChars
        case .name:
            sortedChars.sort {
                $0.name.localizedCaseInsensitiveCompare($1.name) == (isAscending ? .orderedAscending : .orderedDescending)
            }
        case .id:
            sortedChars.sort {
                $0.id.localizedCaseInsensitiveCompare($1.id) == (isAscending ? .orderedAscending : .orderedDescending)
            }
        }
        
        return sortedChars
    }
    
    var body: some View {
        CharactersListView(characters: sortedCharacters)
            .toolbar {
                ToolbarItem {
                    SortMenuView(sortOption: $sortOption, isAscending: $isAscending)
                }
            }
            .navigationBarTitle("Characters", displayMode: .inline)
        
    }
    
}


struct AllCharactersTabView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        AllCharactersTabView(characters: modelData.allCharacters)
    }
}
