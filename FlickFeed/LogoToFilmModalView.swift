//
//  LogoToFilmModalView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 17/12/24.
//

import SwiftUI

struct LogoToFilmModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var films: [Film] // Cambiado a Film
    @State private var searchText: String = ""

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    // Filtrar películas en función del texto de búsqueda
    var filteredFilms: [Film] { // Cambiado a Film
        if searchText.isEmpty {
            return films
        } else {
            return films.filter { $0.title.lowercased().contains(searchText.lowercased()) }
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
                        ForEach(filteredFilms) { film in // Cambiado a Film
                            VStack {
                                Image(film.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 160, height: 235)
                                    .cornerRadius(8)

                                TextField("Enter film name", text: Binding(
                                    get: { film.title },
                                    set: { newValue in
                                        if let index = films.firstIndex(where: { $0.id == film.id }) {
                                            films[index].title = newValue
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
    LogoToFilmModalView(films: .constant([
        Film(
            title: "Mean Girls",
            imageName: "Movie1",
            bannerImageName: "Banner1",
            year: "2004",
            genre: "Comedy",
            director: "Mark Waters",
            duration: "1h 37m",
            synopsis: "A girl navigates the complex world of high school cliques."
        ),
        Film(
            title: "The Exorcist",
            imageName: "Movie2",
            bannerImageName: "Banner2",
            year: "1973",
            genre: "Horror",
            director: "William Friedkin",
            duration: "2h 2m",
            synopsis: "A terrifying story of demonic possession."
        )
    ]))
}


