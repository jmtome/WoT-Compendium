//
//  WheelApp.swift
//  Wheel
//
//  Created by macbook on 13/06/2023.
//

import SwiftUI

@main
struct WheelApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environment(\.colorScheme, .dark)
        }
        
    }
}
