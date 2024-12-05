//
//  News_AppApp.swift
//  News-App
//
//  Created by Jack Delamou on 05/12/2024.
//

import SwiftUI
import SwiftData

@main
struct News_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
