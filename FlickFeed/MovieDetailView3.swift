//
//  MovieDetailView3.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 17/12/24.
//

import SwiftUI

// Estructura para las reviews
struct Review: Identifiable {
    let id = UUID()
    let username: String
    let rating: Int
    let comment: String
}

struct MovieDetailView3: View {
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
                    Image("Movie3") // Imagen del banner desde los assets
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .overlay(Color.black.opacity(0.4)) // Overlay oscuro
                        .ignoresSafeArea(edges: .top) // Extiende la imagen hasta el borde superior
                
                    // Poster Image Overlay (Imagen de la película)
                    Image("Movie3") // Imagen del poster
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .offset(x: -35, y: 100)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
                .padding(.bottom, 6)
                
                // Información de la película
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Movie Title")
                            .font(.largeTitle)
                            .bold()
                        
                        Text("2024 • Drama • 2h 10m")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Directed by Fulanito")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Sinopsis
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.title2)
                        .bold()
                    
                    Text("This is the synopsis of the movie. Here you can add detailed information about the plot, the storyline, or any other interesting facts about the movie. The synopsis section helps provide context to the user.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Botones alineados
                HStack(spacing: 16) {
                    // Botón Add to Watchlist
                    Button(action: {
                        isInWatchlist.toggle()
                    }) {
                        Text(isInWatchlist ? "Added to Watchlist" : "Add to Watchlist")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isInWatchlist ? Color.green : Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
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
                    }
                }
                .padding(.horizontal)

                // "Your Rating" (estrellas moradas)
                if userRating > 0 {
                    VStack(spacing: 8) {
                        Text("Your Rating")
                            .font(.subheadline)
                        
                        HStack {
                            ForEach(1...5, id: \.self) { star in
                                Image(systemName: star <= userRating ? "star.fill" : "star")
                                    .font(.subheadline)
                                    .foregroundColor(star <= userRating ? .purple : .gray)
                                    .onTapGesture {
                                        userRating = star // Permite cambiar la calificación
                                    }
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
                    
                    if reviews.isEmpty {
                        Text("No reviews yet. Be the first to review this movie!")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    } else {
                        ForEach(reviews) { review in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(review.username)
                                        .font(.headline)
                                    Spacer()
                                    HStack(spacing: 4) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Image(systemName: index < review.rating ? "star.fill" : "star")
                                                .foregroundColor(index < review.rating ? .purple : .gray)
                                        }
                                    }
                                }
                                Text(review.comment)
                                    .font(.body)
                                    .foregroundColor(.gray)
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
        .navigationTitle("Movie Detail")
        
        // Ventana para calificar
        .sheet(isPresented: $showRatingPopup) {
            VStack(spacing: 20) {
                Text("Rate & Review")
                    .font(.title)
                    .bold()
                
                // Calificación con estrellas
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= userRating ? "star.fill" : "star")
                            .font(.largeTitle)
                            .foregroundColor(star <= userRating ? .purple : .gray)
                            .onTapGesture {
                                userRating = star
                            }
                    }
                }
                
                // Campo para comentario
                TextField("Write your review...", text: $reviewComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
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
                }
                .padding()
            }
            .padding()
        }
    }
}

struct MovieDetailView3_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView3()
    }
}

