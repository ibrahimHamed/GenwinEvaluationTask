//
//  ScreenshotCell.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    @IBOutlet weak var screenshotImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        screenshotImageView.image = nil
    }
    
    func configure(image: String){
        screenshotImageView.setImageFrom(url: image)
    }

}
