//
//  MovieDetailView3.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 17/12/24.
//

import SwiftUI

struct Review: Identifiable {
    let id = UUID()
    let username: String
    let rating: Int
    let comment: String
}

struct MovieDetailView3: View {
    let film: Film  // Aquí usas el modelo Film
    
    @State private var userRating: Int = 0 // Rating del usuario
    @State private var showRatingPopup = false // Para mostrar la ventana emergente de calificación
    @State private var isInWatchlist = false // Si está en la watchlist o no
    @State private var reviews: [Review] = [] // Lista de reviews
    @State private var reviewComment: String = "" // Comentario del review

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Imagen principal y Poster
                ZStack(alignment: .bottomTrailing) {
                    // Imagen de fondo (Banner)
                    Image(film.bannerImageName) // Imagen del banner desde los assets
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .overlay(Color.black.opacity(0.4)) // Overlay oscuro
                        .ignoresSafeArea(edges: .top) // Extiende la imagen hasta el borde superior
                        .accessibilityHidden(true) // Ignora la imagen

                    // Poster Image Overlay (Imagen de la película)
                    Image(film.imageName) // Imagen del poster
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .offset(x: -35, y: 100)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .accessibilityHidden(true) // Ignora la imagen
                }
                .padding(.bottom, 6)
                
                // Información de la película
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(film.title)
                            .font(.largeTitle)
                            .bold()
                            .accessibilityLabel(film.title) // Etiqueta accesible para el título

                        Text("\(film.year) • \(film.genre) • \(film.duration)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .accessibilityLabel("Year:\(film.year),Genre: \(film.genre),Film Duration: \(film.duration)") // Descripción accesible

                        Text("Directed by \(film.director)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .accessibilityLabel("Directed by \(film.director)") // Descripción accesible
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Sinopsis
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.title2)
                        .bold()
                    Text(film.synopsis) // Usamos la sinopsis del modelo Film
                        .font(.body)
                        .foregroundColor(.gray)
                        .accessibilityLabel(film.synopsis) // Descripción accesible
                }
                .accessibilityElement(children: .combine)
                
                .padding(.horizontal)
                
                // Botones alineados
                HStack(spacing: 16) {
                    // Botón Add to Watchlist
                    Button(action: {
                        isInWatchlist.toggle()
                    }) {
                        Text(isInWatchlist ? "On your Watchlist" : "Add to Watchlist")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isInWatchlist ? Color.gray : Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .accessibilityLabel(isInWatchlist ? "Remove from Watchlist" : "Add to Watchlist") // Descripción accesible para el botón
                    }
                    
                    // Botón Rate or Review
                    Button(action: {
                        showRatingPopup = true
                    }) {
                        Text(userRating > 0 ? "Rate Again" : "Rate")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .accessibilityLabel(userRating > 0 ? "Rate Again" : "Rate this movie") // Descripción accesible para el botón
                    }
                }
                .padding(.horizontal)

                // "Your Rating" (estrellas moradas)
                if userRating > 0 {
                    VStack(spacing: 8) {
                        Text("Your Rating")
                            .font(.subheadline)
                            .accessibilityAddTraits(.isHeader) // Etiqueta como encabezado

                        HStack {
                            ForEach(1...5, id: \.self) { star in
                                Image(systemName: star <= userRating ? "star.fill" : "star")
                                    .font(.subheadline)
                                    .foregroundColor(star <= userRating ? .purple : .gray)
                                    .onTapGesture {
                                        userRating = star // Permite cambiar la calificación
                                    }
                                    .accessibilityLabel("\(star <= userRating ? "Selected" : "Not selected") star \(star)") // Descripción accesible
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Sección de Reviews
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reviews")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .accessibilityAddTraits(.isHeader) // Etiqueta como encabezado
                    
                    if reviews.isEmpty {
                        Text("No reviews yet. Be the first to review this movie!")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .accessibilityLabel("No reviews yet. Be the first to review this movie.") // Descripción accesible cuando no hay reseñas
                    } else {
                        ForEach(reviews) { review in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(review.username)
                                        .font(.headline)
                                        .accessibilityLabel("Review by \(review.username)") // Descripción accesible para el nombre del revisor
                                    Spacer()
                                    HStack(spacing: 4) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Image(systemName: index < review.rating ? "star.fill" : "star")
                                                .foregroundColor(index < review.rating ? .purple : .gray)
                                                .accessibilityHidden(true) // Ignorar las estrellas
                                        }
                                    }
                                }
                                Text(review.comment)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .accessibilityLabel(review.comment) // Descripción accesible del comentario
                            }
                            .padding()
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        
        // Ventana para calificar
        .sheet(isPresented: $showRatingPopup) {
            VStack(spacing: 20) {
                Text("Rate & Review")
                    .font(.title)
                    .bold()
                    .accessibilityAddTraits(.isHeader) // Etiqueta como encabezado
                
                // Calificación con estrellas
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= userRating ? "star.fill" : "star")
                            .font(.largeTitle)
                            .foregroundColor(star <= userRating ? .purple : .gray)
                            .onTapGesture {
                                userRating = star
                            }
                            .accessibilityLabel("\(star <= userRating ? "Selected" : "Not selected") star \(star)") // Descripción accesible
                    }
                }
                
                // Campo para comentario
                TextField("Write your review...", text: $reviewComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .accessibilityLabel("Write your review here") // Descripción accesible para el campo de texto
                
                // Botón para guardar
                Button(action: {
                    let newReview = Review(username: "Tali López", rating: userRating, comment: reviewComment)
                    reviews.append(newReview)
                    showRatingPopup = false
                    reviewComment = "" // Limpia el campo de texto
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .accessibilityLabel("Submit your review") // Descripción accesible para el botón
                }
                .padding()
            }
            .padding()
        }
    }
}

struct MovieDetailView3_Previews: PreviewProvider {
    static var previews: some View {
        // Proveemos un ejemplo de "film" para la vista previa
        MovieDetailView3(film: Film(title: "The Exorcist", imageName: "Movie2", bannerImageName: "Banner2", year: "1973", genre: "Horror", director: "William Friedkin", duration: "2h 2m", synopsis: "A terrifying story of demonic possession."))
    }
}


