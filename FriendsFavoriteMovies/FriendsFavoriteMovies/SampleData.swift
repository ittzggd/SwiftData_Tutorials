//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Katherine JANG on 4/5/24.
//

import Foundation
import SwiftData

/// In previous Friends app, model container was created using the .modelContainer modifier
/// Here, build it explicitly without relying on the modifier
/// That way, instead of needing to repeat sample data code in many places

@MainActor
class SampleData {
	static let shared = SampleData()
	
	/// model container will store data in memory without persisting ti
	let modelContainer: ModelContainer
	
	/// computed property to access the main context of the model container
	var context: ModelContext {
		modelContainer.mainContext
	}
	
	
	/// code in init scope from the sharedModelContainer closure of FriendsFavoriteApp file
	/// This code performs all the necessary setup for SwiftData.
	private init() {
		let schema = Schema([
			Movie.self,
		])
		/// make the model configuration to store its data in memory only not disk
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
		
		do {
			modelContainer =  try ModelContainer(for: schema, configurations: [modelConfiguration])
			insertSampleData()
		} catch {
			fatalError("Could not create ModelContainer \(error)")
		}
	}
	
	func insertSampleData() {
		for movie in Movie.sampleData {
			context.insert(movie)
		}
		do {
			/// save function is defined by ModelContext
			try context.save()
		} catch {
			print("Sample data context failed to save")
		}
	}
	
	var movie: Movie  {
		Movie.sampleData[0]
	}
}
