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
    var totalNumberOfPages: Int {
        return (movieCount / limit).rounding(nearest: Float(limit))
    }
    
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
    let cover: String
    let genres: [String]?
    let backgroundImage: String?
    let firstScreenShot: String?
    let secondScreenShot: String?
    let thirdScreenShot: String?
    let cast: [Cast]?
    let torrents: [Torrent]?
    let synopsis: String?
    let videoId: String?
    
    var screenshots: [String] {
        return [firstScreenShot, secondScreenShot, thirdScreenShot].compactMap({$0})
    }
    
    enum CodingKeys: String, CodingKey {
        case imdbId = "imdb_code"
        case title
        case year
        case rating
        case cover = "medium_cover_image"
        case genres
        case backgroundImage = "background_image_original"
        case firstScreenShot = "large_screenshot_image1"
        case secondScreenShot = "large_screenshot_image2"
        case thirdScreenShot = "large_screenshot_image3"
        case cast
        case torrents
        case synopsis
        case videoId = "yt_trailer_code"
    }
}

struct Cast: Codable {
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "url_small_image"
    }
}

struct Torrent: Codable {
    let url: String
    let quality: String
}
