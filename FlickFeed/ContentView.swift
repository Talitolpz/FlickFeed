//
//  ContentView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//


import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var isModalPresented: Bool = false
    
    // Películas con nombres para las imágenes
    @State private var movies = [
        "Movie1", "Movie2", "Movie3", "Movie4", "Movie5",
        "Movie6", "Movie7", "Movie8", "Movie9", "Movie10",
        "Movie11", "Movie12", "Movie13", "Movie14", "Movie15",
        "Movie16", "Movie17", "Movie18", "Movie19", "Movie20",
        "Movie21", "Movie22", "Movie23", "Movie24", "Movie25",
        "Movie26", "Movie27", "Movie28", "Movie29", "Movie30", "Movie31", "Movie32", "Movie33", "Movie34", "Movie36", "Movie37", "Movie38", "Movie39", "Movie40", "Movie41","Movie42", "Movie43", "Movie44", "Movie45", "Movie46", "Movie47", "Movie48", "Movie49", "Movie50"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Popular this week
                    Text("Popular this week")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(0..<10, id: \.self) { index in
                                VStack {
                                    Image(movies[index]) // Mostrar la imagen
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)
                                    
                                    Text(movies[index]) // Título de la película
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // New from friends
                    Text("New from friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(10..<20, id: \.self) { index in
                                VStack {
                                    Image(movies[index]) // Mostrar la imagen
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)
                                    
                                    Text(movies[index]) // Título de la película
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Popular with friends
                    Text("Popular with friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(20..<30, id: \.self) { index in
                                VStack {
                                    Image(movies[index]) // Mostrar la imagen
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 190)
                                        .cornerRadius(10)
                                    
                                    Text(movies[index]) // Título de la película
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
                ToolbarItem {
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isModalPresented) {
                        // Pasamos los nombres de las películas y permitimos cambiar el texto
                        LogoToFilmModalView(movies: movies)
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

