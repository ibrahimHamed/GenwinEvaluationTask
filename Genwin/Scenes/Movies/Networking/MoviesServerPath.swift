//
//  MoviesServerPath.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation

enum MoviesServerPath {
    case movieList
    case movieDetails
}

extension MoviesServerPath: ServerPath {
    var value: String {
        switch self {
        case .movieList:
            return "list_movies.json"
        case .movieDetails:
            return "movie_details.json"
        }
    }
    
    
}
