//
//  QualityCell.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class QualityCell: UICollectionViewCell {

    @IBOutlet weak private var viewBackground: UIView!
    @IBOutlet weak private var qualityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    private func setupDesign(){
        viewBackground.addBorder(color: .white, width: 1)
        viewBackground.round(4)
    }
    
    func configure(quality: String){
        qualityLabel.text = quality
    }

}
