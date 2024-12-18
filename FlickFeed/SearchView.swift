//
//  SearchView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

// Estructura para las categorías
struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct SearchView: View {
    @State private var searchText: String = "" // Track the search input
    
    // Lista de categorías con imágenes asociadas
    let categories = [
        Category(name: "Action", imageName: "ActionImage"),
        Category(name: "Comedy", imageName: "ComedyImage"),
        Category(name: "Drama", imageName: "DramaImage"),
        Category(name: "Horror", imageName: "HorrorImage"),
        Category(name: "Romance", imageName: "RomanceImage"),
        Category(name: "Thriller", imageName: "ThrillerImage"),
        Category(name: "Sci-Fi", imageName: "SciFiImage"),
        Category(name: "Documentary", imageName: "DocumentaryImage")
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    TextField("Search movies or genres...", text: $searchText)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        )
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                // Browse Categories Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(categories) { category in
                            ZStack(alignment: .bottomLeading) {
                                // Imagen de fondo para la categoría
                                Image(category.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 120)
                                    .cornerRadius(12)
                                    .clipped()
                                
                                // Texto superpuesto
                                Text(category.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                }
            }
            .navigationTitle("Search")
        }
    }
}


#Preview {
    SearchView()
}
