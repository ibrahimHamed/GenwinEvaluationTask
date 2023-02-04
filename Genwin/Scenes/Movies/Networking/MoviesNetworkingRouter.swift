//
//  MoviesNetworkingRouter.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Alamofire

enum MoviesNetworkingRouter {
    case movieList(page: Int)
    case movieDetails
}

extension MoviesNetworkingRouter: APIRouter {
    var method: HTTPMethod {
        switch self {
        case .movieList:
            return .get
        case .movieDetails:
            return .get
        }
    }
    
    var path: ServerPath {
        switch self {
        case .movieList:
            return MoviesServerPath.movieList
        case .movieDetails:
            return MoviesServerPath.movieDetails
        }
    }
    
    var parameters: APIParameters? {
        switch self {
        case let .movieList(page):
            return [
                MoviesParametersKeys.page.rawValue: page
            ]
        case .movieDetails:
            return [:]
        }
    }
    
    
}
