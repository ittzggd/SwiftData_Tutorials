//
//  ContentView.swift
//  Birthdays
//
//  Created by Katherine JANG on 4/5/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
		FriendsView()
			.modelContainer(for: Friend.self)
    }
}

#Preview {
    ContentView()
}
