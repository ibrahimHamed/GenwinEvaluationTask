//
//  MovieCellViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation

class MovieCellViewModel {
    var imdbId: String
    var title: String
    var year: String
    var genre: String
    var cover: String
    var synopsis: String
    init(movie: Movie) {
        self.imdbId = movie.imdbId
        self.title = movie.title
        self.year = String(movie.year)
        if let genre = movie.genres?[0] {
            self.genre = genre
        } else {
            self.genre = "Unknown"
        }
        self.cover = movie.cover
        self.synopsis = movie.synopsis ?? ""
    }
    
}
