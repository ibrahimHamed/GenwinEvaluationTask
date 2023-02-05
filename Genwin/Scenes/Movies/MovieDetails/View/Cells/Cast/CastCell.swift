//
//  CastCell.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class CastCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        castImageView.image = nil
        castNameLabel.text = nil
    }
    
    private func setupDesign(){
        castImageView.round(30)
    }
    
    func configure(cast: CastViewModel){
        castImageView.setImageFrom(url: cast.image)
        castNameLabel.text = cast.name
    }

}
