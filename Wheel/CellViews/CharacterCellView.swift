//
//  CharacterCellView.swift
//  Wheel
//
//  Created by macbook on 20/06/2023.
//

import SwiftUI

struct CharacterCellView: View {
    var character: Character
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(character.name)
                .bold()
            Text(character.info)
                .font(.caption)
                .foregroundColor(.primary)
                .lineLimit(4)
            if !character.appearances.isEmpty {
                HStack {
                    Text("Appears in:")
                        .font(.subheadline)
                        .foregroundColor(Color(uiColor: .systemGray))
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            ForEach(character.appearances, id: \.book.id) { appearance in
                                Text("\(appearance.book.bookTitle) (Ch: \(appearance.chapter.id))")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .padding(.top, 10)
            }
            
            if !character.seeAlso.isEmpty {
                Text("See Also: \(character.seeAlso)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
            
        }
        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
    }
    
    func appearsIn(character: Character) -> String {
        
        let apps = character.appearances.map { appearance in
            "Book: " + appearance.book.bookTitle + " Chapter: " + appearance.chapter.id
        }.joined(separator: ", ")
        
        return apps
    }
}

struct CharacterCellView_Previews: PreviewProvider {
//    static var character = ModelData().book.chapters[1].characters[0]
    static var character = ModelData().allCharacters[0]
    static var previews: some View {
        CharacterCellView(character: character)
    }
}
