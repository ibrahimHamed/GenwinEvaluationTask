//
//  MovieCell.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var yearLabel: UILabel!
    @IBOutlet weak private var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialDesign()
    }
    
    private func setupInitialDesign(){
        containerView.round()
    }
    
    func configure(with movie: MovieCellViewModel){
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        genreLabel.text = movie.genre
    }
    
    

}
