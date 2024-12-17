//
//  LogoToFilmModalView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 17/12/24.
//

import SwiftUI

struct LogoToFilmModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText: String = ""
    
    // Lista de películas con sus nombres correspondientes (hasta las primeras 50, puedes añadir más si lo necesitas)
    @State private var movieTitles = [
        "Mean Girls", "The Exorcist", "Sick of Myself", "Dead Poets Society", "Fight Club",
        "Scooby Doo", "The Lobster", "Eternal Sunshine of the Spotless Mind", "American Beauty", "Promising Young Woman",
        "Shiva Baby", "Pan's Labyrinth", "Forrest Gump", "How to Train Your Dragon", "Almost Famous",
        "Home Alone", "Suspiria", "LadyBird", "Gremlins", "Her",
        "Bridget Jones's Diary", "León: The Professional", "The Goonies", "But I'm A Cheerleader", "Romeo + Juliet",
        "Closer", "Challengers", "Call Me By Your Name", "Paris, Texas", "Beautiful Boy",
        "Ready Or Not", "The Perks of Being a Wallflower", "American Psycho", "Hereditary", "Eraserhead",
        "The Others", "Portrait Of A Lady On Fire", "Poor Things", "E.T.", "Black Swan",
        "Clueless", "Carol", "Possession", "Chungking Express", "Frances Ha",
        "Jawbreaker", "In The Mood For Love", "Sabrina", "Jojo Rabbit"
    ]
    
    let movies: [String]
    
    // Establecer las columnas del Grid
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var filteredMovies: [String] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        // Modificado para evitar el error "index out of range"
                        ForEach(0..<min(movies.count, 50), id: \.self) { index in
                            VStack {
                                // Imagen de la película
                                Image(movies[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 160, height: 235)
                                    .cornerRadius(8)
                                
                                // TextField para cambiar el nombre de la película
                                TextField("Enter movie name", text: $movieTitles[index])
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .padding(8)
                                    .background(Color.purple.opacity(0.1)) // Fondo para mejorar la visibilidad
                                    .cornerRadius(8) // Bordes redondeados
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.clear) // Eliminamos el borde del rectángulo
                                    )
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Add a Film")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.vertical, 10)
    }
}

struct LogoToFilmViewModal_Previews: PreviewProvider {
    static var previews: some View {
        LogoToFilmModalView(movies: ["Movie1", "Movie2", "Movie3", "Movie4", "Movie5"])
    }
}

