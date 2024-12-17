//
//  LogoToFilmModalView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 17/12/24.
//

import SwiftUI

struct LogoToFilmModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var movies: [Movie]
    @State private var searchText: String = ""

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    // Filtrar películas en función del texto de búsqueda
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Barra de búsqueda
                SearchBar(text: $searchText)
                    .padding(.horizontal)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredMovies) { movie in
                            VStack {
                                Image(movie.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 160, height: 235)
                                    .cornerRadius(8)

                                TextField("Enter movie name", text: Binding(
                                    get: { movie.title },
                                    set: { newValue in
                                        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
                                            movies[index].title = newValue
                                        }
                                    }
                                ))
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding(8)
                                .background(Color.purple.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Add a Film")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    LogoToFilmModalView(movies: .constant([
        Movie(imageName: "Movie1", title: "Mean Girls"),
        Movie(imageName: "Movie2", title: "The Exorcist")
    ]))
}

