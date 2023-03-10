//
//  MoviesListVC.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import UIKit

class MoviesListVC: BaseVC {
    
    // MARK: - Outlets -
    @IBOutlet weak private var collectionView: UICollectionView!
    
    //MARK: - Properties
    var viewModel: MoviesListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialDesign()
        setupCollectionView()
        setupBinding()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupStatusBar()
        addLogoToNavBar()
    }
    
    private func setupInitialDesign(){
        view.backgroundColor = AppColors.shared.grayBackgroundColor
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: MovieCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    private func setupStatusBar(){
        setupStatusBar(color: AppColors.shared.grayStatusBarColor)
    }
    
    private func addLogoToNavBar(){
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.setHeight(constant: 30)
        navigationItem.titleView = logo
    }
    
    private func setupBinding(){
        viewModel.movies.binding { [weak self] (movies) in
            self?.collectionView.reloadData()
        }
    }
}

//MARK: - CollectionView Extension
extension MoviesListVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: MovieCell.self, for: indexPath)
        cell.configure(with: viewModel.getMovie(indexPath: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectMovie(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width =  (collectionView.frame.width - 42) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = viewModel.numberOfMovies()
        if indexPath.row == count - 2 {
            viewModel.fetchNextPage()
        }
    }
}

