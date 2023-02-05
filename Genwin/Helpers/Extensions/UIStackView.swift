//
//  UIStackView.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit


extension UIStackView {
    
    func animateToTop() {
        self.layoutIfNeeded()
        let views = self.arrangedSubviews
        var index = 0
        let tableHeight: CGFloat = self.bounds.size.height
        for i in views {
            let cell = i as UIView
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
    
}

