//
//  MoviesListViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

class MoviesListViewModel: BaseViewModel {
    
    private var totalNumberOfPages: Int = 0
    private var currentPage = 1
    var movies: ObservableObject<[MovieCellViewModel]> = ObservableObject([])
    
    private let navigator: MainNavigatorProtocol
    
    init(navigator: MainNavigatorProtocol){
        self.navigator = navigator
    }
    
    func fetchNextPage(){
        if currentPage < totalNumberOfPages {
            currentPage += 1
            fetchMovies()
        }
    }
    
    func viewDidLoad(){
        self.fetchMovies()
    }
    
    func numberOfMovies()-> Int {
        return movies.value.count
    }
    
    func didSelectMovie(at indexPath: IndexPath) {
        let imdbId = movies.value[indexPath.row].imdbId
        let synopsis = movies.value[indexPath.row].synopsis
        navigator.navigateTo(destination: .movieDetails(imdbId, synopsis))
    }
    
    func getMovie(indexPath: IndexPath) -> MovieCellViewModel {
        return movies.value[indexPath.row]
    }
    
}

// MARK: - Networking -
extension MoviesListViewModel {
    private func fetchMovies(){
        showIndicator()
        MoviesNetworkingRouter.movieList(page: currentPage).send { [weak self] (response: GenericResponseModel<MoviesModel>?, errorType) in
            guard let self = self else { return }
            self.hideIndicator()
            if let response = response {
                self.totalNumberOfPages = response.data?.totalNumberOfPages ?? 0
                self.movies.value.append(contentsOf: response.data?.movies.compactMap({MovieCellViewModel(movie: $0)}) ?? [])
            } else if let errorMessage = errorType?.rawValue {
                self.showErrorAlert(error: errorMessage)
            }
        }
    }
}
