//
//  MovieDataViewViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import Foundation

class MovieDataViewViewModel {
    var backgroundImage: String
    var coverImage: String
    var year: String
    var genre: String
    var rating: String
    var torrents: [Torrent]
    
    init(movie: Movie){
        backgroundImage = movie.backgroundImage ?? ""
        coverImage = movie.cover
        year = String(movie.year)
        genre = movie.genres?.joined(separator: ",") ?? ""
        rating = String(movie.rating) + "/10"
        torrents = movie.torrents ?? []
    }
    
    func numberOfTorrent()-> Int {
        return torrents.count
    }
    
    func getTorrentQuality (at indexPath: IndexPath) -> String {
        return torrents[indexPath.row].quality
    }
}
