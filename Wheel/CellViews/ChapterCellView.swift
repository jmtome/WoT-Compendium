//
//  ChapterCellView.swift
//  Wheel
//
//  Created by macbook on 20/06/2023.
//

import SwiftUI

struct ChapterCellView: View {
    var chapter: Chapter
    var body: some View {
        HStack(alignment: .center, spacing: 30){
            Image(chapter.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Chapter:").font(.title3).bold()
                    Text(chapter.id).font(.title2)
                }
                HStack {
                    Text("Title:")
                        .font(.title3)
                    Text(chapter.chapterTitle)
                }
                
                Text("Characters: \(chapter.characters.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ChapterCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterCellView(chapter: ModelData().book.chapters.first!)
    }
}
