//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by Katherine JANG on 4/5/24.
//

import Foundation
import SwiftData

@Model
final class Movie {
	var title: String
	var releasedDate: Date
	
	init(title: String, releaseDate: Date) {
		self.title = title
		self.releasedDate = releaseDate
	}
	
	static let sampleData = [
		/// The r	eference date is fixed -> Jan 1 2001
		Movie(title: "Amusing Space Traveler 3",
			  releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
		Movie(title: "Difficult Cat",
			  releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
		Movie(title: "Electrifying Trek",
			  releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
		Movie(title: "Reckless Train Ride 2",
			  releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
		Movie(title: "The Last Venture",
			  releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
		Movie(title: "Glamorous Neighbor",
			  releaseDate: Date(timeIntervalSinceReferenceDate: 700_000_000))
	]
}
