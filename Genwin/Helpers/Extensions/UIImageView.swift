//
//  UIImageView.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

extension UIImageView {
    func setImageFrom(url: String){
        DownloadImageManager.shared.download(from: url) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
