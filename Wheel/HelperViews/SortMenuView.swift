//
//  SortMenuView.swift
//  Wheel
//
//  Created by macbook on 16/06/2023.
//

import SwiftUI

//This view is coupled to my specific SortCategory type, it would be nice to make it generic
struct SortMenuView: View {
    @Binding var sortOption: SortCategory
    @Binding var isAscending: Bool
    
    var body: some View {
        Menu {
            ForEach(SortCategory.allCases) { category in
                Toggle(isOn: Binding(
                    get: {
                        sortOption == category
                    },
                    set: { newValue in
                        if sortOption == category {
                            isAscending.toggle()
                        } else {
                            sortOption = category
                            isAscending = true
                        }
                    }
                )) {
                    Label {
                        Text(category.rawValue)
                    } icon: {
                        if sortOption == category && sortOption != .all {
                            Image(systemName: isAscending ? "chevron.up" : "chevron.down")
                        }
                    }
                }
            }
        } label: {
            Label("Sort", systemImage: "arrow.up.arrow.down")
        }
    }
}

struct SortMenuView_Previews: PreviewProvider {
    @State static var sortOption: SortCategory = .name
    @State static var isAscending: Bool = true
    
    static var previews: some View {
        SortMenuView(sortOption: $sortOption, isAscending: $isAscending)
    }
}
