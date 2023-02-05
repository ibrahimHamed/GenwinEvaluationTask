//
//  MainNavigator.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import UIKit

enum MainDestination {
    case moviesList
    case movieDetails(String,String?)
}

protocol MainNavigatorProtocol {
    func navigateTo(destination: MainDestination)
}

class MainNavigator: MainNavigatorProtocol {
    private var navigationController: UINavigationController? {
        return controller.navigationController
    }

    let controller: UIViewController

    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func navigateTo(destination: MainDestination) {
        switch destination {
        case .moviesList:
            controller.push(MainFactory.MoviesList())
        case let .movieDetails(imdbId,synopsis):
            controller.push(MainFactory.MovieDetails(imdbId: imdbId, synopsis: synopsis))
        }
    }
}
