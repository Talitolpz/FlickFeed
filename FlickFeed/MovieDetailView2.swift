//
//  MovieDetailView2.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 17/12/24.
//
import SwiftUI

struct MovieDetailView2: View {
    @State private var userRating: Int = 0 // Rating del usuario
    @State private var showRatingPopup = false // Para mostrar la ventana emergente de calificación
    @State private var isInWatchlist = false // Si está en la watchlist o no

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Banner and Poster Overlay
                ZStack(alignment: .bottomTrailing) {
                    // Imagen de fondo (Banner)
                    Image("Movie57") // Imagen de fondo (aquí usas tu imagen de assets)
                        .resizable()
                        //.scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .overlay(Color.black.opacity(0.4)) // Opacidad para mejorar legibilidad
                
                    // Poster Image Overlay (Imagen de la película, al lado derecho)
                    Image("Movie81") // Imagen de poster (también usando la imagen de assets)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .offset(x: -35, y: 100) // Posicionando el poster
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
                .padding(.bottom, 6) // Ajuste del espacio
                
                // Información de la película (debajo del banner)
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

                // Sección de Sinopsis
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.title2)
                        .bold()
                    
                    Text("This is the synopsis of the movie. Here you can add detailed information about the plot, the storyline, or any other interesting facts about the movie. The synopsis section helps provide context to the user.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Botón Add to Watchlist
                Button(action: {
                    isInWatchlist.toggle()
                }) {
                    Text(isInWatchlist ? "Added to Watchlist" : "Add to Watchlist")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isInWatchlist ? Color.green : Color.blue)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                }
                
                // Botón Rate & Review
                Button(action: {
                    showRatingPopup = true
                }) {
                    Text(userRating > 0 ? "Rate Again" : "Rate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Mostrar calificación actual si existe
                if userRating > 0 {
                    HStack {
                        Text("Your Rating: ")
                            .font(.headline)
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= userRating ? "star.fill" : "star")
                                .foregroundColor(star <= userRating ? .purple : .black)
                        }
                    }
                    .padding()
                }

                // Reparto (Cast & Crew) - para mantener tu diseño anterior
                VStack(alignment: .leading, spacing: 8) {
                    Text("Cast & Crew")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<5, id: \.self) { _ in
                                VStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 80, height: 80)
                                    
                                    Text("Name")
                                        .font(.subheadline)
                                        .lineLimit(1)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        // Ventana para calificar
        .sheet(isPresented: $showRatingPopup) {
            VStack {
                Text("Rate This Movie")
                    .font(.title)
                    .padding()
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= userRating ? "star.fill" : "star")
                            .font(.largeTitle)
                            .foregroundColor(star <= userRating ? .purple : .black)
                            .onTapGesture {
                                userRating = star
                            }
                    }
                }
                .padding()
                Button(action: {
                    showRatingPopup = false
                }) {
                    Text("Confirm")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
    }
}

struct MovieDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView2()
    }
}

