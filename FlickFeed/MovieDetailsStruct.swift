//
//  MovieDetailsStruct.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 18/12/24.
//

import Foundation

struct MovieDetail: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let bannerImageName: String
    let year: String
    let genre: String
    let director: String
    let duration: String
    let synopsis: String
}

let movies = [
    MovieDetail(
        title: "Sick of Myself",
        imageName: "Movie3",
        bannerImageName: "MovieBanner3",
        year: "2024",
        genre: "Drama",
        director: "Knut Erik Jensen",
        duration: "1h 45m",
        synopsis: "A young artist becomes obsessed with self-expression, using extreme methods to seek recognition and validation from society, pushing the boundaries of his identity and relationships."
    ),
    MovieDetail(
           title: "Shiva Baby",
           imageName: "Movie11",
           bannerImageName: "Movie11",
           year: "2020",
           genre: "Drama",
           director: "Emma Seligman",
           duration: "1h 17m",
           synopsis: "A college student unexpectedly runs into her sugar daddy at a Jewish funeral service, where she is forced to confront the secrets of her life, including her relationships with her family and friends."
    ),
    MovieDetail(
        title: "The Grand Budapest Hotel",
        imageName: "Movie116",
        bannerImageName: "116",
        year: "2014",
        genre: "Drama",
        director: "Wes Anderson",
        duration: "1h 39m",
        synopsis: "A quirky story of a hotel concierge and his adventures with a young protégé, set against the backdrop of a fictional European country in the 1930s."
    ),
    MovieDetail(
        title: "Hocus Pocus",
        imageName: "Movie81",
        bannerImageName: "Movie81",
        year: "1993",
        genre: "Comedy",
        director: "Kenny Ortega",
        duration: "1h 36m",
        synopsis: "Three witches, resurrected in modern-day Salem, wreak havoc and attempt to steal the lives of children, while a group of teenagers tries to stop them."
    ),
    MovieDetail(
        title: "León: The Professional",
        imageName: "Movie22",
        bannerImageName: "Movie22",
        year: "1994",
        genre: "Action",
        director: "Luc Besson",
        duration: "1h 50m",
        synopsis: "A hitman forms an unlikely bond with a young girl whose family has been murdered, and he becomes her protector and teacher in the art of assassination."
    ),
    MovieDetail(
        title: "Pan's Labyrinth",
        imageName: "Movie12",
        bannerImageName: "Movie12",
        year: "2006",
        genre: "Fantasy",
        director: "Guillermo del Toro",
        duration: "1h 58m",
        synopsis: "During the Spanish Civil War, a young girl discovers a mystical labyrinth and encounters creatures that lead her on a journey to restore peace to the kingdom."
    ),
    MovieDetail(
        title: "Shrek 2",
        imageName: "Movie93",
        bannerImageName: "Movie93",
        year: "2004",
        genre: "Comedy",
        director: "Andrew Adamson",
        duration: "1h 33m",
        synopsis: "Shrek and Fiona face more challenges when they visit Fiona's parents. Shrek tries to win the approval of her father, but things take a turn when the villainous prince charming shows up."
    ),
    MovieDetail(
        title: "The Exorcist",
        imageName: "Movie2",
        bannerImageName: "Movie2",
        year: "1973",
        genre: "Horror",
        director: "William Friedkin",
        duration: "2h 2m",
        synopsis: "A young girl is possessed by a demonic force, leading her mother and a team of priests to fight to save her soul in this iconic horror film."
    ),
    MovieDetail(
        title: "The Lobster",
        imageName: "Movie7",
        bannerImageName: "Movie7",
        year: "2015",
        genre: "Drama",
        director: "Yorgos Lanthimos",
        duration: "1h 58m",
        synopsis: "In a dystopian society, single people must find a mate within 45 days or be transformed into animals. A man grapples with the rules of society while falling in love."
    ),
    MovieDetail(
        title: "Dead Poets Society",
        imageName: "Movie4",
        bannerImageName: "Movie4",
        year: "1989",
        genre: "Drama",
        director: "Peter Weir",
        duration: "2h 8m",
        synopsis: "A new English teacher at an elite boys' prep school inspires his students to appreciate poetry, seize the day, and break away from the norms of society."
    ),
    MovieDetail(
        title: "Fight Club",
        imageName: "Movie5",
        bannerImageName: "Movie5",
        year: "1999",
        genre: "Drama",
        director: "David Fincher",
        duration: "2h 19m",
        synopsis: "An insomniac office worker forms an underground fight club with a soap salesman. Their anarchistic philosophy and violence grow out of control."
    ),
    MovieDetail(
        title: "Scooby Doo",
        imageName: "Movie6",
        bannerImageName: "Movie6",
        year: "2002",
        genre: "Adventure, Comedy, Mystery",
        director: "Raja Gosnell",
        duration: "1h 26m",
        synopsis: "Scooby-Doo and the gang investigate a spooky amusement park haunted by a mysterious villain, revealing dark secrets from the past."
    ),
    MovieDetail(
        title: "Almost Famous",
        imageName: "Movie15",
        bannerImageName: "MovieBanner15",
        year: "2000",
        genre: "Comedy, Drama, Music",
        director: "Cameron Crowe",
        duration: "2h 2m",
        synopsis: "A young music journalist goes on tour with a rock band in the 1970s, experiencing the highs and lows of fame, relationships, and self-discovery."
    )
]
