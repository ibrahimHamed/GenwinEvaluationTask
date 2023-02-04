//
//  MoviesListViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

class MoviesListViewModel {
    
    private let navigator: MainNavigatorProtocol
    
    init(navigator: MainNavigatorProtocol){
        self.navigator = navigator
    }
    
    func goToMovieDetails(id: String){
        navigator.navigateTo(destination: .movieDetails(id))
    }
}
