//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Katherine JANG on 4/5/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
	@Query(sort: \Movie.title) private var movies: [Movie]
	
	@State private var newMovie: Movie?

    var body: some View {
		/// NavigationSplitView displays a 'sidebar' and 'detail'
		/// sidebar: contains list
		/// detail: navigation stack onto which you push them
		/// The detail closure holds the root view of the navigation stack;
        NavigationSplitView {
			Group {
				List {
					ForEach(movies) { movie in
						// The label closure of the navigation link holds the view that the List displays.
						NavigationLink {
							MovieDetail(movie: movie)
						} label: {
							Text(movie.title)
						}
					}
					.onDelete(perform: deleteItems)
				}
			}
			.navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
			.sheet(item: $newMovie) { movie in
				NavigationStack {
					MovieDetail(movie: movie, isNew: true)
				}
			}
        } detail: {
			// Navigation title for the detail views
            Text("Select a movie")
				.navigationTitle("Movie")
        }
    }

    private func addMovie() {
		withAnimation {
			let newItem = Movie(title: "", releaseDate: .now)
			modelContext.insert(newItem)
			newMovie = newItem
		}
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    ContentView()
		.modelContainer(SampleData.shared.modelContainer)
}
