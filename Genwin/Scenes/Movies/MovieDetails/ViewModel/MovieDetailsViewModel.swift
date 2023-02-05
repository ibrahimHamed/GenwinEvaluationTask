//
//  MovieDetailsViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

class MovieDetailsViewModel {
    
    private let navigator: MainNavigatorProtocol
    private let imdbId: String
    
    init(imdbId: String,navigator: MainNavigatorProtocol){
        self.navigator = navigator
        self.imdbId = imdbId
    }
}
