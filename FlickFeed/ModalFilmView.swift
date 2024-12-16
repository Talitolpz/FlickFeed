//
//  ModalFilmView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct LogoToFilmModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText: String = ""
    let movies: [String]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var filteredMovies: [String] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredMovies, id: \.self) { movie in
                            VStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 160, height: 235)
                                
                                Text(movie)
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Add a film")
        }
    }
}
 

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.vertical, 10)
    }
}

struct LogoToFilmViewModal_Previews: PreviewProvider {
    static var previews: some View {
        LogoToFilmModalView(movies: [String]())
    }
}
