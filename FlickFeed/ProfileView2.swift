//
//  ProfileView2.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct ProfileView2: View {
    let favoriteMovies = ["Movie131", "Movie81", "Movie22", "Movie12", "Movie116", "Movie93"]
    let recentActivity = ["Movie3", "Movie75", "Movie68", "Movie80", "Movie55", "Movie49", "Movie54", "Movie71"]
    
    @State private var isSeeAllPresented = false
    @State private var movieCategory: [String] = []

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
                            ForEach(favoriteMovies, id: \.self) { movie in
                                Image(movie) // Mostrar imagen desde assets
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 190)
                                    .cornerRadius(10)
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
                            ForEach(recentActivity, id: \.self) { movie in
                                Image(movie) // Mostrar imagen desde assets
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 190)
                                    .cornerRadius(10)
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
    let movies: [String]
    
    // Definir las columnas para la vista en columnas
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(movies, id: \.self) { movie in
                        Image(movie) // Mostrar imagen desde assets
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 235)
                            .cornerRadius(10)
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
