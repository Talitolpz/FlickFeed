//
//  ContentView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isModalPresented: Bool = false

    // Lista de películas con títulos e imágenes
    @State private var movies = [
        Movie(imageName: "Movie1", title: "Mean Girls"),
        Movie(imageName: "Movie2", title: "The Exorcist"),
        Movie(imageName: "Movie3", title: "Sick of Myself"),
        Movie(imageName: "Movie4", title: "Dead Poets Society"),
        Movie(imageName: "Movie5", title: "Fight Club"),
        Movie(imageName: "Movie6", title: "Scooby Doo"),
        Movie(imageName: "Movie7", title: "The Lobster"),
        Movie(imageName: "Movie8", title: "Eternal Sunshine of the Spotless Mind"),
        Movie(imageName: "Movie9", title: "American Beauty"),
        Movie(imageName: "Movie10", title: "Promising Young Woman"),
        Movie(imageName: "Movie11", title: "Shiva Baby"),
        Movie(imageName: "Movie12", title: "Pan's Labyrinth"),
        Movie(imageName: "Movie13", title: "Forrest Gump"),
        Movie(imageName: "Movie14", title: "How to Train Your Dragon"),
        Movie(imageName: "Movie15", title: "Almost Famous"),
        Movie(imageName: "Movie16", title: "Home Alone"),
        Movie(imageName: "Movie17", title: "Suspiria"),
        Movie(imageName: "Movie18", title: "LadyBird"),
        Movie(imageName: "Movie19", title: "Gremlins"),
        Movie(imageName: "Movie20", title: "Her"),
        Movie(imageName: "Movie21", title: "Bridget Jones's Diary"),
        Movie(imageName: "Movie22", title: "León: The Professional"),
        Movie(imageName: "Movie23", title: "The Goonies"),
        Movie(imageName: "Movie24", title: "But I'm A Cheerleader"),
        Movie(imageName: "Movie25", title: "Romeo + Juliet"),
        Movie(imageName: "Movie26", title: "Closer"),
        Movie(imageName: "Movie27", title: "Challengers"),
        Movie(imageName: "Movie28", title: "Call Me By Your Name"),
        Movie(imageName: "Movie29", title: "Paris, Texas"),
        Movie(imageName: "Movie30", title: "Beautiful Boy")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Sección 1: Popular this week
                    Text("Popular this week")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(movies.prefix(10)) { movie in
                                VStack {
                                    Image(movie.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)

                                    Text(movie.title)
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Sección 2: New from friends
                    Text("New from friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(movies[10..<20]) { movie in
                                VStack {
                                    Image(movie.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)

                                    Text(movie.title)
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Sección 3: Popular with friends
                    Text("Popular with friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(movies[20..<30]) { movie in
                                VStack {
                                    Image(movie.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)

                                    Text(movie.title)
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding()
                    }
                    .sheet(isPresented: $isModalPresented) {
                        LogoToFilmModalView(movies: $movies)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}






