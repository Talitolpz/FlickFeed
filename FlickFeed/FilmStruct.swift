//
//  FilmStruct.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 18/12/24.
//

import Foundation

struct Film: Identifiable {
    let id = UUID()
    var title: String
    let imageName: String
    let bannerImageName: String
    let year: String
    let genre: String
    let director: String
    let duration: String
    let synopsis: String
}



