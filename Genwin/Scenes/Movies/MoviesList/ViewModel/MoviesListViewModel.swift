//
//  MoviesListViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

class MoviesListViewModel: BaseViewModel {
    
    private var dataSource: MoviesModel?
    private var currentPage = 1
    var movies: ObservableObject<[MovieCellViewModel]> = ObservableObject([])
    
    private let navigator: MainNavigatorProtocol
    
    init(navigator: MainNavigatorProtocol){
        self.navigator = navigator
    }
    
    func goToMovieDetails(id: String){
        navigator.navigateTo(destination: .movieDetails(id))
    }
    
    
    private func fetchMovies(){
        MoviesNetworkingRouter.movieList(page: currentPage).send { [weak self] (response: GenericResponseModel<MoviesModel>?, errorType) in
            guard let self = self else { return }
            if let response = response {
                self.dataSource = response.data
                self.movies.value = response.data?.movies.compactMap({MovieCellViewModel(movie: $0)})
            } else if let errorMessage = errorType?.rawValue {
                
            }
        }
        }
    }
