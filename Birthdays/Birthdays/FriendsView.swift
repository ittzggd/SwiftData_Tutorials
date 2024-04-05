//
//  FriendsView.swift
//  Birthdays
//
//  Created by Katherine JANG on 4/5/24.
//

import SwiftUI
import SwiftData

struct FriendsView: View {
	/// @Query asks SwiftData for an array of data
	/// When instance stored in SwiftData is updated, the query updates views, 
	/// just like a @State property does
	@Query(sort: \Friend.birthday) private var friends: [Friend]
	
	/// SwiftData requires a ModelContext to save new items
	/// ModelContext provides a connection between the view and the model container
	///  -> can fetch, insert, and delete items in the container
	@Environment(\.modelContext) private var context
	
	@State private var newName = ""
	@State private var newDate = Date.now
	
    var body: some View {
		NavigationStack {
			/// SwiftData provides each instance with its own identity seperate from its data
			List(friends) { friend in
				HStack {
					if friend.isBirthdayToday {
						Image(systemName: "birthday.cake")
					}
					Text("\(friend.name)")
						.bold(friend.isBirthdayToday)
					Spacer()
					Text(friend.birthday, format: .dateTime.month(.wide).day().year())
				}
			}
			.navigationTitle("Birthdays")
			.safeAreaInset(edge: .bottom) {
				VStack(alignment: .center, spacing: 20) {
					Text("NewBirthDay")
					DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
						TextField("Name", text: $newName)
							.textFieldStyle(.roundedBorder)
					}
					Button("Save") {
						let newFriend = Friend(name: newName, birthday: newDate)
						// insert the new item in the container
						context.insert(newFriend)
						
						newName = ""
						newDate = .now
					}
					.bold()
				}
				.padding()
				.background(.bar)
			}
			/// SwiftUI executes the code in a .task before the view appears
			.task {
				context.insert(Friend(name: "Elton", birthday: .now))
				context.insert(Friend(name: "Jenny", birthday: Date(timeIntervalSince1970: 0)))
			}
		}
    }
}

#Preview {
    FriendsView()
}
