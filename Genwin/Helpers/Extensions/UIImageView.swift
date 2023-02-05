//
//  UIImageView.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageFrom(url: String) {
        self.kf.indicatorType = .activity
        if let newURL = ((url)).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            self.kf.setImage(with: URL(string: newURL), placeholder: UIImage(named: "imagePlaceholder"), options: [.transition(.fade(0.2))])
            return
        }
        self.kf.setImage(with: URL(string: (url)), placeholder: UIImage(named: "imagePlaceholder"), options: [.transition(.fade(0.2))])
    }
}
