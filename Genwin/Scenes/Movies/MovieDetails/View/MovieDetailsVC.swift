//
//  MovieDetailsVC.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import UIKit

class MovieDetailsVC: BaseVC {
    
    // MARK: - Outlet -
    
    @IBOutlet weak private var mainStackView: UIStackView!
    @IBOutlet weak private var movieTrailerView: MovieTrailerView!
    @IBOutlet weak private var movieDataView: MovieDataView!
    @IBOutlet weak private var synopsisLabel: UILabel!
    @IBOutlet weak private var synopsisView: UIView!
    @IBOutlet weak private var screenShotsCollectionView: UICollectionView!
    @IBOutlet weak private var screenshotView: UIView!
    @IBOutlet weak private var castCollectionView: UICollectionView!
    @IBOutlet weak private var castView: UIView!
    
    //MARK: - Properties
    var viewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialDesign()
        setupCollectionView()
        setupBinding()
        removeTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        setupStatusBar()
//        setupNavBar()
        viewModel.viewDidLoad()
        
    }
    
    private func setupInitialDesign(){
        view.backgroundColor = AppColors.shared.blackBackgroundColor
        mainStackView.isHidden = true
        if let synopsis = viewModel.getSynopsis() {
            synopsisLabel.text = synopsis
        } else {
            synopsisView.isHidden = true
        }
    }
    
    private func removeTitle(){
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setupTitle(){
        self.navigationController?.navigationBar.topItem?.title = viewModel.getMovieTitle()
    }
    
    private func setupCollectionView(){
        screenShotsCollectionView.delegate = self
        screenShotsCollectionView.dataSource = self
        screenShotsCollectionView.register(cellType: ScreenshotCell.self)
        
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(cellType: CastCell.self)
    }
    
    private func handleAppearanceForCollectionViews(castCount: Int, screenShotsCount: Int){
        castView.isHidden = castCount == 0 ? true : false
        screenshotView.isHidden = screenShotsCount == 0 ? true : false
    }
    
    private func handleMovieTrailerView(){
        if let videoId = viewModel.getVideoId(), videoId != "" {
            movieTrailerView.configure(videoId: videoId)
            movieTrailerView.isHidden = false
        } else {
            movieTrailerView.isHidden = true
        }
    }
    
    private func setupNavBar(){
        navigationController?.navigationBar.barTintColor = AppColors.shared.orangeNavigationColor
    }
    
    private func setupStatusBar(){
        setupStatusBar(color: AppColors.shared.orangeStatusBarColor)
    }
    
    
    
    private func setupBinding(){
        viewModel.movie.binding { [weak self] (movie) in
            guard let self = self, let movie = movie else { return }
            self.setupTitle()
            self.movieDataView.configure(movie: MovieDataViewViewModel(movie: movie))
            self.handleMovieTrailerView()
            self.screenShotsCollectionView.reloadData()
            self.castCollectionView.reloadData()
            self.mainStackView.isHidden = false
            self.mainStackView.animateToTop()
        }
    }
}

//MARK: - CollectionView Extension
extension MovieDetailsVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        handleAppearanceForCollectionViews(castCount: viewModel.numberOfCast(), screenShotsCount: viewModel.numberOfScreenshots())
        switch collectionView {
        case screenShotsCollectionView:
            return viewModel.numberOfScreenshots()
        case castCollectionView:
            return viewModel.numberOfCast()
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case screenShotsCollectionView:
            let cell = collectionView.dequeueReusableCell(with: ScreenshotCell.self, for: indexPath)
            cell.configure(image: viewModel.getScreenshot(at: indexPath))
            return cell
        case castCollectionView:
            let cell = collectionView.dequeueReusableCell(with: CastCell.self, for: indexPath)
            cell.configure(cast: viewModel.getCast(at: indexPath))
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if collectionView == screenShotsCollectionView {
            let vc = ImageViewerVC.create(images: viewModel.getAllScreenShots(), selectedIndex: indexPath)
            self.present(vc, animated: true)
        } else {
                let vc = ImageViewerVC.create(images: viewModel.getAllCastImages(), selectedIndex: indexPath)
                self.present(vc, animated: true)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case screenShotsCollectionView:
            return CGSize(width: collectionView.frame.width * 0.9,height:collectionView.frame.height)
        case castCollectionView:
            return CGSize(width: 76, height: collectionView.frame.height)
        default:
            return CGSize()
        }
    }
}

