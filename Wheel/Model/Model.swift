//
//  Model.swift
//  Wheel
//
//  Created by macbook on 13/06/2023.
//

import Foundation


final class ModelData: ObservableObject {
    @Published var book: Book!
    @Published var books: [Book]
    @Published var allCharacters: [Character] = []
    
    init() {
        self.books = [load("book-1.json"), load("book-2.json")]
        self.book = books[0]
        self.allCharacters = fillCharacterAppearances()
    }
    
    func getAllCharacters() -> [Character] {
        return books.flatMap { $0.chapters.flatMap { $0.characters } }
    }
    
    func fillCharacterAppearances() -> [Character] {
        var characters: [Character] = []
        var seenCharacterIDs: Set<String> = []
        
        for book in books {
            for chapter in book.chapters {
                for character in chapter.characters {
                    if !seenCharacterIDs.contains(character.id) {
                        // Add the character's appearance to the corresponding character in the characters array
                        if let index = characters.firstIndex(where: { $0.id == character.id }) {
                            characters[index].appearances.append((book: book, chapter: chapter))
                        } else {
                            var updatedCharacter = character
                            updatedCharacter.appearances.append((book: book, chapter: chapter))
                            characters.append(updatedCharacter)
                            seenCharacterIDs.insert(character.id)
                        }
                    }
                }
            }
        }
        
        return characters
    }
}

struct Chapter: Codable, Identifiable, Hashable {
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String
    let chapterTitle: String
    let characters: [Character]
    let imageName: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "chapter_id"
        case chapterTitle = "chapter_title"
        case characters
        case imageName = "image_name"
    }
}

typealias BookAppearance = (book: Book, chapter: Chapter)

struct Character: Codable, Identifiable {
    var id: String {
        return name
    }
    let name: String
    var appearances: [BookAppearance] = []
    
    let info: String
    let seeAlso: String
    
    private enum CodingKeys: String, CodingKey {
        case name, info
        case seeAlso = "see_also"
    }
}

struct Book: Codable {
    let id: String
    let bookTitle: String
    let chapters: [Chapter]
    
    private enum CodingKeys: String, CodingKey {
        case bookTitle = "book_title"
        case chapters
        case id = "book_id"
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil),
          let data = try? Data(contentsOf: file)
    else {
        fatalError("Couln't find \(filename) in main bundle or couldn't load \(filename) from main bundle")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch let error {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


/*
 final class ModelData: ObservableObject {
 @Published var landmarks: [Landmark] = load("landmarkData.json")
 var hikes: [Hike] = load("hikeData.json")
 
 var features: [Landmark] {
 landmarks.filter { $0.isFeatured }
 }
 @Published var profile = Profile.default
 
 var categories: [String: [Landmark]] {
 Dictionary(grouping: landmarks, by: { $0.category.rawValue })
 }
 }
 
 
 func load<T: Decodable>(_ filename: String) -> T {
 guard let file = Bundle.main.url(forResource: filename, withExtension: nil),
 let data = try? Data(contentsOf: file)
 else {
 fatalError("Couln't find \(filename) in main bundle or couldn't load \(filename) from main bundle")
 }
 
 do {
 return try JSONDecoder().decode(T.self, from: data)
 } catch let error {
 fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
 }
 }
 
 */
