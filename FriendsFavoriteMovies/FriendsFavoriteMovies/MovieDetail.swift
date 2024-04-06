//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Katherine JANG on 4/6/24.
//

import SwiftUI

struct MovieDetail: View {
	/// Bindable <- Learn more..
	@Bindable var movie: Movie
	
	let isNew: Bool
	
	@Environment(\.dismiss) private var dismiss
	@Environment(\.modelContext) private var modelContext
	
	init(movie: Movie, isNew: Bool = false) {
		self.movie = movie
		self.isNew = isNew
	}
	
	var body: some View {
		Form {
			TextField("Movie Title", text: $movie.title)
			DatePicker("Release date", selection: $movie.releasedDate, displayedComponents: .date)
		}
		.navigationTitle(isNew ? "New Movie" : "Movie")
		.toolbar {
			if isNew {
				ToolbarItem(placement: .confirmationAction) {
					Button("Done") {
						dismiss()
					}
				}
				
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel") {
						modelContext.delete(movie)
						dismiss()
					}
				}
				
			}
		}
	}
}
	
#Preview {
	NavigationStack {
		MovieDetail(movie: SampleData.shared.movie)
	}
	.modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Movie") {
	NavigationStack {
		MovieDetail(movie: SampleData.shared.movie, isNew: true)
			.navigationBarTitleDisplayMode(.inline)
	}
	.modelContainer(SampleData.shared.modelContainer)
}
