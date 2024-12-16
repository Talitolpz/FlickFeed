//
//  ActivityView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//


import SwiftUI

func libraryRow(title: String, iconName: String, destination: AnyView) -> some View {
    NavigationLink(destination: destination) {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.purple)
                .padding(.trailing, 8)
            
            Text(title)
                .font(.headline)
            
            Spacer()
            
        }
        .padding(.vertical, 8)
    }
}

struct ActivityLibraryView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("My Activity")) {
                    FlickFeed.libraryRow(title: "Watched Movies", iconName: "film", destination: AnyView(WatchedMoviesView()))
                    FlickFeed.libraryRow(title: "Rated Movies", iconName: "star.fill", destination: AnyView(RatedMoviesView()))
                    FlickFeed.libraryRow(title: "My Reviews", iconName: "text.bubble", destination: AnyView(MyReviewsView()))
                }
                
                Section(header: Text("Friends' Activity")) {
                    FlickFeed.libraryRow(title: "Friends' Watched", iconName: "person.2.fill", destination: AnyView(FriendsActivityView()))
                    libraryRow(title: "Friends' Reviews", iconName: "quote.bubble")
                }
                
                Section(header: Text("Other")) {
                    FlickFeed.libraryRow(title: "My Watchlist", iconName: "bookmark.fill", destination: AnyView(WatchlistView()))
                    libraryRow(title: "Diary", iconName: "book.fill")
                }
            }
            .listStyle(.plain) //Para quitar el gris de atrás de la lista
            .navigationTitle("Activity")
        }
    }
    
    func libraryRow(title: String, iconName: String) -> some View {
        NavigationLink(destination: DetailView(title: title)) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.purple)
                    .padding(.trailing, 8)
                
                Text(title)
                    .font(.headline)
                
            }
            .padding(.vertical, 8)
        }
    }
}

struct DetailView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text("Voy a poner algo después en \(title)")
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle(title)
    }
}

struct ActivityLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLibraryView()
    }
}

#Preview {
    ActivityLibraryView()
}
