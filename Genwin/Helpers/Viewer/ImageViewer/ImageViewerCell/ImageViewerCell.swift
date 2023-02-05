//
//  QualityCell.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class ImageViewerCell: UICollectionViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier: String = "ImageViewerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupScrollView()
    }
    
    func setupCell(image: String) {
        self.imageView.setImageFrom(url: image)
    }

}

extension ImageViewerCell: UIScrollViewDelegate {
    
    private func setupScrollView() {
        self.scrollView.delegate = self
        self.scrollView.maximumZoomScale = 2
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
