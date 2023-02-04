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
    
    init(movie: Movie) {
        self.imdbId = movie.imdbId
        self.title = movie.title
        self.year = String(movie.year)
        self.genre = movie.genres[0]
    }
    
}
