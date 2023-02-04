//
//  MovieModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation

struct MoviesModel: Codable {
    let movieCount: Int
    let limit: Int
    let pageNumber: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit
        case pageNumber = "page_number"
        case movies
    }
}

struct Movie: Codable {
    let imdbId: String
    let title: String
    let year: Int
    let rating: Double
    let genres: [String]
    
    enum CodingKeys: String, CodingKey {
        case imdbId = "imdb_code"
        case title
        case year
        case rating
        case genres
    }
    
    
}
