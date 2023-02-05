//  
//  MovieDataView.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class MovieDataView: UIView {
    
    let XIB_NAME = "MovieDataView"
    
    // MARK: - outlets -
    @IBOutlet weak private var backgroundImageView: UIImageView!
    @IBOutlet weak private var movieCoverImageView: UIImageView!
    @IBOutlet weak private var yearLabel: UILabel!
    @IBOutlet weak private var genresLabel: UILabel!
    @IBOutlet weak private var rateLabel: UILabel!
    @IBOutlet weak private var qualityCollectionView: UICollectionView!
    
    // MARK: - Properties -
    private var viewModel: MovieDataViewViewModel?
    
    // MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Design -
    
    private func commonInit() {
        guard let xib = Bundle.main.loadNibNamed(XIB_NAME, owner: self, options: nil)?.first, let viewFromXib = xib as? UIView else { return }
        viewFromXib.frame = bounds
        addSubview(viewFromXib)
        setupDesign()
        setupCollectionView()
    }
    
    private func setupDesign(){
        movieCoverImageView.round()
    }
    
    private func setupCollectionView(){
        qualityCollectionView.delegate = self
        qualityCollectionView.dataSource = self
        qualityCollectionView.register(cellType: QualityCell.self)
    }
    
    func configure(movie: MovieDataViewViewModel){
        backgroundImageView.setImageFrom(url: movie.backgroundImage)
        movieCoverImageView.setImageFrom(url: movie.coverImage)
        yearLabel.text = movie.year
        genresLabel.text = movie.genre
        rateLabel.text = movie.rating
        viewModel = movie
        qualityCollectionView.reloadData()
    }
    
}

//MARK: - CollectionView Extension
extension MovieDataView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfTorrent() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: QualityCell.self, for: indexPath)
//        cell.configure(quality: torrents[indexPath.row].quality)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: collectionView.frame.height)
    }
}

