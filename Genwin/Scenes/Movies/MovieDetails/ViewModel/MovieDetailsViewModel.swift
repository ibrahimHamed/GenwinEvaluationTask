//
//  MovieDetailsViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

class MovieDetailsViewModel: BaseViewModel {
    var movie: ObservableObject<Movie?> = ObservableObject(nil)
    private let navigator: MainNavigatorProtocol
    private let imdbId: String
    private let synopsis: String?
    
    init(imdbId: String,synopsis: String?,navigator: MainNavigatorProtocol){
        self.navigator = navigator
        self.imdbId = imdbId
        self.synopsis = synopsis
    }
    
    func viewDidLoad(){
        fetchSingleMovie()
    }
    func getSynopsis() -> String? {
        return synopsis
    }
    
    func numberOfScreenshots()-> Int {
        return movie.value?.screenshots.count ?? 0
    }
    func numberOfCast()-> Int {
        return movie.value?.cast?.count ?? 0
    }
    
    func getScreenshot(at indexPath : IndexPath) -> String{
        return movie.value?.screenshots[indexPath.row] ?? ""
    }
    
    func getVideoId() -> String? {
        return movie.value?.videoId
    }
    
    func getCast(at indexPath : IndexPath)-> CastViewModel{
        return CastViewModel(cast: movie.value?.cast?[indexPath.row])
    }
}

// MARK: - Networking -
extension MovieDetailsViewModel {
    private func fetchSingleMovie(){
        showIndicator()
        MoviesNetworkingRouter.movieDetails(imdbId: imdbId).send { [weak self] (response:GenericResponseModel<MovieModel>?, errorType) in
            guard let self = self else { return }
            self.hideIndicator()
            if let response = response {
                self.movie.value = response.data?.movie
            } else if let errorMessage = errorType?.rawValue {
                self.showErrorAlert(error: errorMessage)
            }
        }
    }
}
