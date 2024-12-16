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
    
    let movies = [
        "Movie A", "Movie B", "Movie C", "Movie D",
        "Movie E", "Movie F", "Movie G", "Movie H"
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack (alignment: .leading, spacing: 20){
                    Text ("Popular this week")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal){
                        HStack(spacing: 16){
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                        } .padding(.horizontal)
                    }
                    
                    Text("New from friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal){
                        HStack(spacing: 16){
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                        } .padding(.horizontal)
                    }
                    
                    Text ("Popular with friends")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal){
                        HStack(spacing: 16){
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                            RoundedRectangle (cornerRadius: 10)
                                .fill (Color.gray.opacity(0.3))
                                .frame(width: 140, height: 190)
                            
                        } .padding(.horizontal)
                    }
                    
                }
            }
            .toolbar{
                ToolbarItem{
                    Button{
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isModalPresented) {
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
