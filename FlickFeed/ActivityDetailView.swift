//
//  ActivityDetailView.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

import SwiftUI

struct WatchedMoviesView: View {
    let watchedMovies = [
        Movie(imageName: "Movie47", title: "Jawbreaker"),
        Movie(imageName: "Movie76", title: "Eyes Wide Shut"),
        Movie(imageName: "Movie10", title: "Promising Young Woman"),
        Movie(imageName: "Movie100", title: "Nightcrawler"),
        Movie(imageName: "Movie110", title: "Mother"),
        Movie(imageName: "Movie124", title: "Barbarian"),
        Movie(imageName: "Movie149", title: "The Silence Of The Lambs"),
        Movie(imageName: "Movie152", title: "Catch Me If You Can")

    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Definir las columnas para el grid
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(watchedMovies) { movie in
                    VStack {
                        Image(movie.imageName) // Imagen del poster
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 235)
                            .cornerRadius(10)
                        
                        Text(movie.title) // Título de la película
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Watched Movies")
    }
}


//////////////////////////////////////////////////////////////////////


struct RatedMoviesView: View {
    // Películas con sus imágenes y títulos, sin el rating en la estructura Movie
    let ratedMovies = [
        Movie(imageName: "Movie99", title: "Footloose"),
        Movie(imageName: "Movie3", title: "Sick Of Myself"),
        Movie(imageName: "Movie94", title: "Psycho"),
        Movie(imageName: "Movie44", title: "Possession"),
        Movie(imageName: "Movie4", title: "Dead Poets Society"),
        Movie(imageName: "Movie2", title: "The Exorcist")
        
    ]
    
    let ratings = [3, 4, 5, 3, 5, 4] // Las calificaciones para las películas

    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Definir las columnas para el grid
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<ratedMovies.count, id: \.self) { index in
                    VStack {
                        // Imagen del poster
                        Image(ratedMovies[index].imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 235)
                            .cornerRadius(10)
                        
                        // Título de la película
                        Text(ratedMovies[index].title)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                        
                        // Mostrar las estrellas de calificación
                        HStack(spacing: 4) {
                            ForEach(1...5, id: \.self) { star in
                                Image(systemName: star <= ratings[index] ? "star.fill" : "star")
                                    .foregroundColor(star <= ratings[index] ? .purple : .gray)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Rated Movies")
    }
}


////////////////////////////////////////////////////////////////////


struct MyReviewsView: View {
    // Datos de las reseñas
    let reviews = [
        (movie: Movie(imageName: "Movie97", title: "Thirtheen"), review: "Are they really 13??? How???"),
        (movie: Movie(imageName: "Movie59", title: "Midsommar"), review: "It was sooo good and visually stunning."),
        (movie: Movie(imageName: "Movie24", title: "But I'm A Cheerleader"), review: "Wow, just wow"),
        (movie: Movie(imageName: "Movie113", title: "Scott Pilgrim VS The World"), review: "Love this movie, sooo iconic."),
        (movie: Movie(imageName: "Movie143", title: "Girl, Interrupted"), review: "Great perfomance."),
        (movie: Movie(imageName: "Movie123", title: "Close"), review: "Sobbing")
    ]
    
    var body: some View {
        List {
            ForEach(reviews.indices, id: \.self) { index in
                let entry = reviews[index]
                
                HStack(alignment: .top, spacing: 16) {
                    // Poster de la película
                    Image(entry.movie.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 100) // Tamaño ajustado para el poster
                        .cornerRadius(8)
                    
                    // Detalles de la reseña
                    VStack(alignment: .leading, spacing: 8) {
                        // Título de la película
                        Text(entry.movie.title)
                            .font(.headline)
                        
                        // Texto de la reseña
                        Text(entry.review)
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer() // Para mantener el diseño limpio
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .navigationTitle("My Reviews")
    }
}


////////////////////////////////////////////////////////////////////


struct FriendsWatchedView: View {
    // Lista de amigos con sus películas vistas
    let friendsWatched = [
        (friend: "Sebas Presno", movie: Movie(imageName: "Movie141", title: "The Holdovers")),
        (friend: "Gigi Arce", movie: Movie(imageName: "Movie15", title: "Almost Famous")),
        (friend: "Dani Valdes", movie: Movie(imageName: "Movie89", title: "Donnie darko")),
        (friend: "Analía Casillas", movie: Movie(imageName: "Movie1", title: "Mean Girls")),
        (friend: "Gus Vazquez", movie: Movie(imageName: "Movie104", title: "Beetlejuice")),
        (friend: "Dani Paredes", movie: Movie(imageName: "Movie41", title: "Black Swan"))
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Definir las columnas para el grid
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(friendsWatched, id: \.friend) { friend, movie in
                    VStack {
                        HStack(alignment: .top, spacing: 8) {
                            // Icono de perfil del amigo
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.purple)
                                )
                            
                            Text(friend) // Nombre del amigo
                                .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.top, 8)
                            
                            Spacer()
                        }
                        
                        Image(movie.imageName) // Poster de la película
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 235)
                            .cornerRadius(10)
                        
                        Text(movie.title) // Título de la película
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Friends Watched")
    }
}


////////////////////////////////////////////////////

struct FriendsReviewsView: View {
    // Datos de las reseñas de los amigos
    let friendsReviews = [
        (friend: "Gigi Arce", movie: Movie(imageName: "Movie144", title: "Booksmart"), review: "Amazing movie, highly recommended!"),
        (friend: "Daniel Valdes", movie: Movie(imageName: "Movie75", title: "Superbad"), review: "Sooo funny, loved it"),
        (friend: "Sebastián Presno", movie: Movie(imageName: "Movie91", title: "Raw"), review: "I won't eat meat again"),
        (friend: "Daniel Paredes", movie: Movie(imageName: "Movie92", title: "Anatomy Of A Fall"), review: "Wow, it was great")
    ]
    
    var body: some View {
        List {
            ForEach(friendsReviews.indices, id: \.self) { index in
                let entry = friendsReviews[index]
                
                HStack(alignment: .top, spacing: 16) {
                    // Icono de perfil
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.purple)
                                .padding(6) // Ajustar tamaño del ícono dentro del círculo
                        )
                    
                    // Poster e información
                    VStack(alignment: .leading, spacing: 8) {
                        // Nombre del amigo
                        Text(entry.friend)
                            .font(.headline)
                        
                        HStack(spacing: 16) {
                            // Poster de la película
                            Image(entry.movie.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 100)
                                .cornerRadius(8)
                            
                            // Información de la película y reseña
                            VStack(alignment: .leading, spacing: 8) {
                                Text(entry.movie.title)
                                    .font(.headline)
                                
                                Text(entry.review)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Friends' Reviews")
    }
}


///////////////////////////////////////////////////////////////////


struct WatchlistView: View {
    let watchlist = [
        Movie(imageName: "Movie23", title: "The Goonies"),
        Movie(imageName: "Movie90", title: "Death Becomes Her"),
        Movie(imageName: "Movie34", title: "Hereditary"),
        Movie(imageName: "Movie134", title: "The Rocky Horror Picture Show"),
        Movie(imageName: "Movie146", title: "Fallen Angels"),
        Movie(imageName: "Movie125", title: "Memento"),
        Movie(imageName: "Movie140", title: "Perfect Blue"),
        Movie(imageName: "Movie109", title: "Roma Holiday"),
        Movie(imageName: "Movie120", title: "Bottoms"),
        Movie(imageName: "Movie122", title: "Fantastic Mr. Fox"),
        Movie(imageName: "Movie87", title: "The Zone Of Interest"),
        Movie(imageName: "Movie77", title: "A Ghost Story")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Definir las columnas para el grid
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(watchlist) { movie in
                    VStack {
                        Image(movie.imageName) // Imagen del poster
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 235)
                            .cornerRadius(10)
                        
                        Text(movie.title) // Título de la película
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Watchlist")
    }
}



//////////////////////////////////////////////


let diaryEntries = [
    (movie: Movie(imageName: "MovieA", title: "Movie A"), rating: 4, review: "Amazing movie!"),
    (movie: Movie(imageName: "MovieB", title: "Movie B"), rating: 5, review: nil),
    (movie: Movie(imageName: "MovieC", title: "Movie C"), rating: nil, review: "A bit slow but good."),
    (movie: Movie(imageName: "MovieD", title: "Movie D"), rating: nil, review: nil)
]


struct DiaryView: View {
    // Lista de actividades del diario
    let diaryEntries = [
        (movie: Movie(imageName: "Movie12", title: "Pan's Labyrinth"), rating: 5, review: "Amazing movie!"),
        (movie: Movie(imageName: "Movie60", title: "Heathers"), rating: 4, review: nil),
        (movie: Movie(imageName: "Movie31", title: "Ready Or Not"), rating: nil, review: "Better than expected"),
        (movie: Movie(imageName: "Movie19", title: "Gremlins"), rating: nil, review: nil),
        (movie: Movie(imageName: "Movie42", title: "Clueless"), rating: nil, review: "Comfort Movie"),
        (movie: Movie(imageName: "Movie48", title: "In The Mood For Love"), rating: 5, review: nil),
        (movie: Movie(imageName: "Movie74", title: "La Haine"), rating: 5, review: nil),
        (movie: Movie(imageName: "Movie85", title: "Bones And All"), rating: 4, review: "Cannibals Aesthetic"),
        (movie: Movie(imageName: "Movie86", title: "Bodies, Bodies, Bodies"), rating: nil, review: "Hahaha Great"),
        (movie: Movie(imageName: "Movie102", title: "A Clockwork Orange"), rating: nil, review: nil),
        (movie: Movie(imageName: "Movie101", title: "Another Round"), rating: 4, review: nil),
        (movie: Movie(imageName: "Movie96", title: "Freaky Friday"), rating: nil, review: "Classic"),
        (movie: Movie(imageName: "Movie108", title: "Labyrinth"), rating: nil, review: nil),
        (movie: Movie(imageName: "Movie128", title: "Gremlins"), rating: 4, review: "Great Film")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Definir las columnas para el grid
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(diaryEntries.indices, id: \.self) { index in
                    let entry = diaryEntries[index]
                    
                    VStack {
                        // Imagen del póster
                        Image(entry.movie.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 235)
                            .cornerRadius(10)
                        
                        // Título de la película
                        Text(entry.movie.title)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                        
                        // Mostrar rating con estrellas si existe
                        if let rating = entry.rating {
                            HStack(spacing: 4) {
                                ForEach(1...5, id: \.self) { star in
                                    Image(systemName: star <= rating ? "star.fill" : "star")
                                        .foregroundColor(star <= rating ? .purple : .gray)
                                }
                            }
                        }
                        
                        // Mostrar reseña si existe
                        if let review = entry.review {
                            Text("“\(review)”")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .italic()
                                .multilineTextAlignment(.center)
                                .padding(.top, 4)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Diary")
    }
}


#Preview{
    DiaryView ()
}
