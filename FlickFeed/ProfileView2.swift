//
//  ProfileView2.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//


import SwiftUI

struct ProfileView2: View {
    let favoriteMovies = ["Favorite 1", "Favorite 2", "Favorite 3", "Favorite 4"]
    let recentActivity = ["Watched 1", "Watched 2", "Watched 3", "Watched 4", "Watched 5"]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Section
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 120, height: 120)
                    
                    // Name and Description
                    Text("Name Lastname")
                        .font(.title)
                        .bold()
                    
                    Text("blahblah blahblah blah blah blahblah blah blah blah")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                // Favorite Films
                VStack(alignment: .leading, spacing: 16) {
                    Text("Favorite Films")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    HStack(spacing: 16) {
                        ForEach(favoriteMovies, id: \.self) { movie in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 120)
                                
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Recent Activity
                VStack(alignment: .leading, spacing: 16) {
                    Text("Recent Activity")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recentActivity, id: \.self) { movie in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 80, height: 120)
                                   
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView2()
}