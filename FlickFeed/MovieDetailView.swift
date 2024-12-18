//
//  MovieDetailView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

/*/ Estructura para las reviews
struct Review: Identifiable {
    let id = UUID()
    let username: String
    let rating: Int
    let comment: String
}

struct MovieDetailView: View {
    let movieImageName: String
    let secondaryImageName: String
    
    @State private var reviews: [Review] = [
        Review(username: "John Doe", rating: 5, comment: "Amazing movie! A must-watch."),
        Review(username: "Jane Smith", rating: 4, comment: "Really enjoyed it, great visuals."),
        Review(username: "MovieFan88", rating: 3, comment: "It was okay, could have been better.")
    ]
    @State private var isReviewModalPresented = false
    @State private var isWatchlistAdded = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Imagen principal (Banner)
                Image(movieImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                    .overlay(Color.black.opacity(0.4)) // Opacidad para mejorar legibilidad
                
                // Sección horizontal: Poster y texto
                HStack(alignment: .top, spacing: 16) {
                    // Poster Image
                    Image(secondaryImageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.3))
                        )
                    
                    // Información de la película
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Movie Title")
                            .font(.title)
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
                
                // Synopsis Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.title2)
                        .bold()
                    
                    Text("This is the synopsis of the movie. Here you can add detailed information about the plot, the storyline, or any other interesting facts about the movie. The synopsis section helps provide context to the user.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Add to Watchlist Button
                Button(action: {
                    isWatchlistAdded.toggle()
                }) {
                    Text(isWatchlistAdded ? "Added to Watchlist" : "Add to Watchlist")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isWatchlistAdded ? Color.green : Color.blue)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                }
                
                // Button to Rate and Review
                Button(action: {
                    isReviewModalPresented.toggle()
                }) {
                    Text("Rate & Review")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $isReviewModalPresented) {
                    AddReviewModal(reviews: $reviews)
                }
                
                // Reviews Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reviews")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(reviews) { review in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(review.username)
                                    .font(.headline)
                                Spacer()
                                HStack(spacing: 4) {
                                    ForEach(0..<5, id: \.self) { index in
                                        Image(systemName: index < review.rating ? "star.fill" : "star")
                                            .foregroundColor(index < review.rating ? .yellow : .gray)
                                    }
                                }
                            }
                            Text(review.comment)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                        .shadow(radius: 2)
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Movie Detail")
    }
}

// Modal para agregar una nueva review
struct AddReviewModal: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var reviews: [Review]
    
    @State private var comment: String = ""
    @State private var rating: Int = 3 // Calificación por defecto
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Add a Review")
                    .font(.title)
                    .bold()
                
                Text("Rating")
                    .font(.headline)
                
                // Estrellas
                HStack {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: star <= rating ? "star.fill" : "star")
                            .font(.largeTitle)
                            .foregroundColor(star <= rating ? .yellow : .gray)
                            .onTapGesture {
                                rating = star
                            }
                    }
                }
                
                // Comentario
                TextField("Your Comment", text: $comment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(height: 100)
                
                // Guardar Review
                Button(action: {
                    let newReview = Review(username: "Tali López", rating: rating, comment: comment)
                    reviews.append(newReview)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Submit Review")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieImageName: "Movie2", secondaryImageName: "Movie3")
    }
}

 */
