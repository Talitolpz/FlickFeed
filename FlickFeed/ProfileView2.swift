//
//  ProfileView2.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct ProfileView2: View {
    // Películas favoritas con estructura Movie
    let favoriteMovies: [Movie] = [
        Movie(imageName: "Movie131", title: "Little Miss Sunshine"),
        Movie(imageName: "Movie81", title: "Hocus Pocus"),
        Movie(imageName: "Movie22", title: "León: The Professional"),
        Movie(imageName: "Movie12", title: "Pan's Labyrinth"),
        Movie(imageName: "Movie116", title: "The Grand Budapest Hotel"),
        Movie(imageName: "Movie93", title: "Shrek 2")
    ]
    
    // Actividad reciente con estructura Movie
    let recentActivity: [Movie] = [
        Movie(imageName: "Movie3", title: "Sick of Myself"),
        Movie(imageName: "Movie75", title: "Superbad"),
        Movie(imageName: "Movie68", title: "The Holiday"),
        Movie(imageName: "Movie80", title: "The Butterfly Effect"),
        Movie(imageName: "Movie55", title: "The Worst Person in the World"),
        Movie(imageName: "Movie49", title: "Sabrina"),
        Movie(imageName: "Movie54", title: "Call Me By Your Name"),
        Movie(imageName: "Movie71", title: "10 Things I Hate About You")
    ]
    
    @State private var isSeeAllPresented = false
    @State private var movieCategory: [Movie] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Section
                VStack(spacing: 12) {
                    Image("ProfilePic")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                        .shadow(radius: 10)
                    
                    // Name and Description
                    Text("Tali López")
                        .font(.title)
                        .bold()
                    
                    Text("I just love movies")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                // Favorite Films Section with Horizontal Scroll
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Favorite Films")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button(action: {
                            movieCategory = favoriteMovies
                            isSeeAllPresented.toggle()
                        }) {
                            Text("See All")
                                .font(.subheadline)
                                .foregroundColor(.purple) // Morado
                                .padding(.trailing)
                        }
                    }
                    .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(favoriteMovies) { movie in
                                VStack {
                                    Image(movie.imageName) // Mostrar imagen desde assets
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)
                                    
                                    Text(movie.title) // Título de la película
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                                
                // Recent Activity Section with Horizontal Scroll
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Recent Activity")
                            .font(.title2)
                            .bold()
                        Spacer()
                        Button(action: {
                            movieCategory = recentActivity
                            isSeeAllPresented.toggle()
                        }) {
                            Text("See All")
                                .font(.subheadline)
                                .foregroundColor(.purple) // Morado
                                .padding(.trailing)
                        }
                    }
                    .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recentActivity) { movie in
                                VStack {
                                    Image(movie.imageName) // Mostrar imagen desde assets
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)
                                    
                                    Text(movie.title) // Título de la película
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $isSeeAllPresented) {
            SeeAllMoviesView(movies: movieCategory)
        }
    }
}

struct SeeAllMoviesView: View {
    let movies: [Movie]
    
    // Definir las columnas para la vista en columnas
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(movies) { movie in
                        VStack {
                            Image(movie.imageName) // Mostrar imagen desde assets
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 235)
                                .cornerRadius(10)
                            
                            Text(movie.title) // Título de la película
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("All Movies")
        }
    }
}


#Preview {
    ProfileView2()
}
