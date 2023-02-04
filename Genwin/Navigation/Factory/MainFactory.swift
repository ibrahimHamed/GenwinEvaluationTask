//
//  MainFactory.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

class MainFactory {
    static func MoviesList() -> MoviesListVC {
        let vc = MoviesListVC()
        let vm = MoviesListViewModel(navigator: MainNavigator(vc))
        vc.viewModel = vm
        return vc
    }
    
    static func MovieDetails(id: String) -> MovieDetailsVC {
        let vc = MovieDetailsVC()
        let vm = MovieDetailsViewModel(navigator: MainNavigator(vc))
        vc.viewModel = vm
        return vc
    }
}
