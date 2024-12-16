//
//  SearchView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = "" // Track the search input
    let categories = [
        "Action", "Comedy", "Drama", "Horror",
        "Romance", "Thriller", "Sci-Fi", "Documentary"
    ]

    var body: some View {
        NavigationView{
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
                        ForEach(categories, id: \.self) { category in
                            ZStack(alignment: .bottomLeading) {
                                // Placeholder for category image
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 120)
                                
                                // Overlay text for category
                                Text(category)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                }
            }        .navigationTitle("Search")

        }
    }
}

#Preview {
    SearchView()
}
