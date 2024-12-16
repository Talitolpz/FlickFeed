//
//  ActivityDetailView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

struct WatchedMoviesView: View {
    let watchedMovies = [
        "Movie A", "Movie B", "Movie C", "Movie D"
    ]
    
    var body: some View {
        List {
            ForEach(watchedMovies, id: \.self) { movie in
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                    
                    Text(movie)
                        .font(.headline)
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Watched Movies")
    }
}

struct RatedMoviesView: View {
    let ratedMovies = [
        ("Movie X", "⭐⭐⭐"),
        ("Movie Y", "⭐⭐⭐⭐"),
        ("Movie Z", "⭐⭐⭐⭐⭐")
    ]
    
    var body: some View {
        List {
            ForEach(ratedMovies, id: \.0) { movie, rating in
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(movie)
                            .font(.headline)
                        Text(rating)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Rated Movies")
    }
}

struct MyReviewsView: View {
    let reviews = [
        ("Movie A", "Amazing movie, highly recommended!"),
        ("Movie B", "Good but a bit slow."),
        ("Movie C", "Didn't like it much.")
    ]
    
    var body: some View {
        List {
            ForEach(reviews, id: \.0) { movie, review in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 50, height: 50)
                           
                        Text(movie)
                            .font(.headline)
                        
                        Spacer()
                    }
                    
                    Text(review)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.leading, 58) // Align text with movie name
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("My Reviews")
    }
}

struct FriendsActivityView: View {
    let friendsActivity = [
        ("Friend 1", "Watched Movie D"),
        ("Friend 2", "Reviewed Movie E"),
        ("Friend 3", "Rated Movie F ⭐⭐⭐")
    ]
    
    var body: some View {
        List {
            ForEach(friendsActivity, id: \.0) { friend, activity in
                HStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                        .overlay(Image(systemName: "person.crop.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .font(.caption).foregroundColor(.gray))
                    
                    VStack(alignment: .leading) {
                        Text(friend)
                            .font(.headline)
                        Text(activity)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Friends' Activity")
    }
}

struct WatchlistView: View {
    let watchlist = [
        "Movie G", "Movie H", "Movie I", "Movie J"
    ]
    
    var body: some View {
        List {
            ForEach(watchlist, id: \.self) { movie in
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                    
                    Text(movie)
                        .font(.headline)
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Watchlist")
        .listStyle(.plain)
    }
}

#Preview{
    FriendsActivityView()
}
