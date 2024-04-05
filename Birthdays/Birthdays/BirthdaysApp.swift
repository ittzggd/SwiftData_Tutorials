//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Katherine JANG on 4/5/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(for: Friend.self)
        }
    }
}
